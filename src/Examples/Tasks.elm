module Examples.Tasks exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Process
import Task exposing (Task)


-- MODEL
type alias Model =
    { count : Int
    , msg : String
    }


-- INIT
init : () -> ( Model, Cmd Msg )
init _ =
    ( { count = 0, msg = "Listo" }
    , Cmd.none
    )


-- MSG
type Msg
    = Cambiar Int -- desplazamiento
    | Resultado (Result String Int)



-- TAREA ENCADENADA: espera 1 segundo -> intenta cambiar -> si va bien, termina
aplicarCambio : Int -> Int -> Task String Int
aplicarCambio cambio actual =
    let
        nuevoValor =
            actual + cambio
    in
    if nuevoValor < 0 then
        Task.fail "No se puede bajar de 0"

    else
        Task.succeed nuevoValor


tareaCambio : Int -> Int -> Task String Int
tareaCambio cambio actual =
    Process.sleep 1000
        |> Task.andThen (\_ -> aplicarCambio cambio actual)



-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Cambiar cambio ->
            ( { model | msg = "Esperando 1 segundo..." }
            , Task.attempt Resultado (tareaCambio cambio model.count)
            )

        Resultado (Ok nuevoValor) ->
            ( { model | count = nuevoValor, msg = "Todo bien, todo ok" }
            , Cmd.none
            )

        Resultado (Err err) ->
            ( { model | msg = "Error: " ++ err }
            , Cmd.none
            )



-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text ("Contador: " ++ String.fromInt model.count) ]
        , p [] [ text model.msg ]
        , button [ onClick (Cambiar 1) ] [ text "+1 (tras 1s)" ]
        , button [ onClick (Cambiar -1) ] [ text "-1 (tras 1s)" ]
        ]



-- MAIN
main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }