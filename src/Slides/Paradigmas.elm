module Slides.Paradigmas exposing (view)

import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (class)
view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "3. Paradigmas" ]

        , p []
            [ text "Inicialmente basado en la Programación Funcional Reactiva (FRP)." ]

        , p []
            [ text "Debido a la alta complejidad, creó su propio modelo The Elm Architecture (TEA)." ]

        , p []
            [ text "Soporta la programación funcional, y los aspectos reactivos necesarios." ]

        , p []
            [ text "Pueden lograrse algunos aspectos de la programación orientada a objetos." ]

        , p []
            [ text "No admite aspectos de la programación imperativa, ni lógica." ]
        ]