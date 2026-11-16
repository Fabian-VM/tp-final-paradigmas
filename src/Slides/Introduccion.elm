module Slides.Introduccion exposing (view)

import Html exposing (Html, div, h1, li, p, ul, text)
import Html.Attributes exposing (class)

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "1. Introducción" ]

        , p []
            [ text "Elm es un lenguaje funcional y reactivo diseño para crear interfaces web." ]

        , ul []
            [ li [] [ text "Está inspirado en Haskell." ]
            , li [] [ text "Se llama \"Elm\" por un árbol." ]
            , li [] [ text "Propone resolver problemas de la programación imperativa con Javascript." ]
            , li [] [ text "Propone un modelo importante llamado \"The Elm Architecture (TEA)\"." ]
            , li [] [ text "Posee un framework llamado \"Elm Land\"." ]
            ]
        ]