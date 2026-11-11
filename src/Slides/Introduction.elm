module Slides.Introduction exposing (view)

import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (style)


view : Html msg
view =
    div
        [ style "text-align" "center"
        , style "padding" "80px 20px"
        ]
        [ h1
            [ style "font-size" "48px" ]
            [ text "Introducción a Elm" ]

        , p
            [ style "font-size" "22px"
            , style "color" "#666"
            ]
            [ text "Un lenguaje funcional para aplicaciones web" ]
        ]
