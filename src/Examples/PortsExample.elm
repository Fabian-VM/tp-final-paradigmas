port module Examples.PortsExample exposing (main)

import Browser
import Html exposing (Html, button, div, h1, input, p, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onClick, onInput)



-- PUERTOS (Elm <-> JS)


-- Elm -> JS: manda un String a localStorage
port saveNota : String -> Cmd msg


-- JS -> Elm: recibe la nota cargada desde localStorage
port loadNotaReceiver : (String -> msg) -> Sub msg



-- MODEL


type alias Model =
    { draft : String
    , saved : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { draft = ""
      , saved = ""
      }
    , Cmd.none
    )



-- MSG


type Msg
    = DraftChanged String
    | GuardarNota
    | NotaRecibida String



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DraftChanged nuevoTexto ->
            ( { model | draft = nuevoTexto }, Cmd.none )

        GuardarNota ->
            ( { model | saved = model.draft }
            , saveNota model.draft -- dispara el port hacia JS
            )

        NotaRecibida textoDesdeJs ->
            ( { model | saved = textoDesdeJs, draft = textoDesdeJs }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    loadNotaReceiver NotaRecibida -- escucha mensajes que llegan desde JS



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Demo de Ports en Elm" ]
        , input
            [ placeholder "Escribí una nota..."
            , value model.draft
            , onInput DraftChanged
            ]
            []
        , button [ onClick GuardarNota ] [ text "Guardar en localStorage" ]
        , p [] [ text ("Guardado: " ++ model.saved) ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }