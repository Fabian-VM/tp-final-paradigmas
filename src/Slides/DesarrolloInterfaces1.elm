module Slides.DesarrolloInterfaces1 exposing (view)

import Html exposing (Html, div, h1, p, text, img)
import Html.Attributes exposing (class, src, width)

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "8. Desarrollo de interfaces" ]
        , p []
            [ text "The Elm Architecture (TEA) es un patrón de diseño de aplicaciones Elm basado en tres componentes fundamentales:" ]

        , img 
            [ src "images/tea-diagram.png"
            , width 1000
            ] 
            []
        ]