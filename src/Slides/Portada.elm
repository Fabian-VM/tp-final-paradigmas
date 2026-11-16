module Slides.Portada exposing (view)

import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (class)

view : Html msg
view =
    div [ class "title-slide" ]
        [ h1 []
            [ text "Introducción a Elm" ]

        , p []
            [ text "Un lenguaje funcional para aplicaciones web" ]
        ]
