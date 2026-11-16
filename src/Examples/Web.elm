module Examples.Web exposing (main)

import Utils.Keyboard exposing (onEnterKeyDownSubscription)
import Browser
import Browser.Dom as Dom
import Html exposing (Html, button, code, div, input, pre, text)
import Html.Attributes exposing (class, id, placeholder, value)
import Html.Events exposing (onClick, onInput)
import Http
import Task


-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



limpiarEspacios : String -> String
limpiarEspacios texto = texto |> String.trim |> String.toLower



-- MODEL

type EstadoPeticion
    = Inicio
    | Exito String
    | Error String


type alias Model =
    { nombrePokemon : String
    , estado : EstadoPeticion
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { nombrePokemon = "pikachu"
      , estado = Inicio
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = CambiarNombre String
    | PedirPokemon
    | RespuestaRecibida (Result Http.Error String)
    | Limpiar
    | FocoListo (Result Dom.Error ())
    | NoOp

subscriptions : Model -> Sub Msg
subscriptions _ = Sub.batch [ onEnterKeyDownSubscription Limpiar NoOp ] 

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CambiarNombre nuevoTexto ->
            ( { model | nombrePokemon = nuevoTexto }, Cmd.none )

        PedirPokemon ->
            ( model
            , Http.get
                { url = "https://pokeapi.co/api/v2/pokemon/" ++ limpiarEspacios model.nombrePokemon
                , expect = Http.expectString RespuestaRecibida
                }
            ) 

        RespuestaRecibida (Ok jsonCrudo) ->
            ( { model | estado = Exito jsonCrudo }, Cmd.none )

        RespuestaRecibida (Err _) ->
            ( { model | estado = Error ("No se encontró el Pokémon: " ++ model.nombrePokemon) }
            , Cmd.none
            )

        Limpiar ->
            ( { model | nombrePokemon = "", estado = Inicio }
            , Task.attempt FocoListo (Dom.focus "input-pokemon")
            )

        FocoListo _ -> ( model, Cmd.none )

        NoOp -> ( model, Cmd.none)




-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ input
            [ id "input-pokemon"
            , placeholder "Ej: charizard, bulbasaur..."
            , value model.nombrePokemon
            , onInput CambiarNombre
            ]
            []
        , button [ onClick PedirPokemon ] [ text "Buscar" ]
        , button [ onClick Limpiar ] [ text "Limpiar" ]
        , div []
            [ case model.estado of
                Inicio ->
                    text "Escribe un Pokémon y haz clic en Buscar."

                Exito json ->
                    pre [ class "json-box" ] [ code [] [ text json ] ]

                Error mensaje ->
                    text mensaje
            ]
        ]



