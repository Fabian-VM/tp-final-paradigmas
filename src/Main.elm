module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

import Slides.Concepts
import Slides.Introduction


-- MODEL

type alias Model =
    { currentSlide : Int
    }


init : Model
init =
    { currentSlide = 0 }


-- UPDATE

type Msg
    = Next
    | Previous


update : Msg -> Model -> Model
update msg model =
    case msg of
        Next ->
            { model
                | currentSlide =
                    min 1 (model.currentSlide + 1)
            }

        Previous ->
            { model
                | currentSlide =
                    max 0 (model.currentSlide - 1)
            }


-- VIEW

view : Model -> Html Msg
view model =
    div
        [ style "font-family" "Arial, sans-serif"
        , style "padding" "40px"
        , style "max-width" "900px"
        , style "margin" "auto"
        ]
        [ div
            [ style "min-height" "350px" ]
            [ viewSlide model.currentSlide ]
        , div
            [ style "display" "flex"
            , style "justify-content" "space-between"
            , style "align-items" "center"
            , style "margin-top" "30px"
            ]
            [ button
                [ onClick Previous
                , style "padding" "10px 20px"
                , style "cursor" "pointer"
                , style "opacity"
                    (if model.currentSlide == 0 then "0.4" else "1")
                ]
                [ text "Anterior" ]

            , text
                (String.fromInt (model.currentSlide + 1)
                    ++ " / 2"
                )

            , button
                [ onClick Next
                , style "padding" "10px 20px"
                , style "cursor" "pointer"
                , style "opacity"
                    (if model.currentSlide == 1 then "0.4" else "1")
                ]
                [ text "Siguiente" ]
            ]
        ]


viewSlide : Int -> Html Msg
viewSlide index =
    case index of
        0 ->
            Slides.Introduction.view

        1 ->
            Slides.Concepts.view

        _ ->
            text "Diapositiva no encontrada"


-- MAIN

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }

