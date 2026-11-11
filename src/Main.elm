module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


hello = "hi"


-- Similar a un registro, diccionario u objeto
type alias Model =
    { slide : Int }


-- Similar a un enum, hay que ver que es exactamente
type Msg
    = Next
    | Previous



init _ =
    ( { slide = 0 }, Cmd.none )


update msg model =
    case msg of
        Next ->
            ( { model | slide = min 2 (model.slide + 1) }
            , Cmd.none
            )

        Previous ->
            ( { model | slide = max 0 (model.slide - 1) }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    div [ class "presentation" ]
        [ viewSlide model.slide
        , div []
            [ button [ onClick Previous ] [ text "Anterior" ]
            , button [ onClick Next ] [ text "Siguiente" ]
            ]
        ]


viewSlide : Int -> Html Msg
viewSlide slide =
    case slide of
        0 ->
            div []
                [ h1 [] [ text "Introducción a Elm" ]
                , p [] [ text "Mi presentación" ]
                ]

        1 ->
            div []
                [ h1 [] [ text "¿Qué es Elm?" ]
                , p [] [ text "Un lenguaje funcional para aplicaciones web." ]
                ]

        _ ->
            div []
                [ h1 [] [ text "Conclusiones" ]
                , p [] [ text "Gracias por su atención." ]
                ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


