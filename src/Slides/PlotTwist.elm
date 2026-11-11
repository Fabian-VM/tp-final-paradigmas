module Slides.PlotTwist exposing (view)

import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (style)


view : Html msg
view =
    div
        [ style "padding" "40px" ]
        [ h1 [] [ text "Plot Twist" ]

        , p []
            [ text "Esta presentación está hecha en Elm" ]
        ]
