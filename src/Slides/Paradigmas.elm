module Slides.Paradigmas exposing (view)

import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (class)
view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "3. Paradigmas" ]

        , p []
            [ text "Fue inicialmente basado en la Programación Funcional Reactiva (FRP)." ]

        , p []
            [ text "Debido a la alta complejidad, tiró la toalla y creó su propio modelo The Elm Architecture (TEA)." ]

        , p []
            [ text "Soporta la programación funcional, y los aspectos reactivos necesarios." ]

        , p []
            [ text "No admite aspectos del resto de paradigmas, a lo sumo algunos de la programación orientada a objetos." ]
        ]