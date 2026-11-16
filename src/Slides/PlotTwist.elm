module Slides.PlotTwist exposing (view)

import Html exposing (Html, div, h1, text, p)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)

view : Html msg
view =
    div [ class "title-slide" ]
        [ h1 [] [ text "Plot Twist" ]
        , p [] [ text "Filminas hechas en Elm."]

        ]
