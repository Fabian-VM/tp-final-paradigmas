module Slides.Introduccion exposing (view)

import Html exposing (Html, div, h1, li, p, ul, text)
import Html.Attributes exposing (class)

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "1. Introducción" ]

        , p []
            [ text "Elm es un lenguaje funcional diseñado para crear interfaces web." ]

        , ul []
            [ li [] [ text "Está inspirado en Haskell." ]
            , li [] [ text "Se llama \"Elm\" por una especie de árbol, y porque suena a \"Element\"." ]
            , li [] [ text "Propone resolver problemas de la programación imperativa con Javascript." ]
            , li [] [ text "Para ello propone su propio modelo llamado \"The Elm Architecture (TEA)\"." ]
            , li [] [ text "Incluso posee un framework llamado \"Elm Land\"." ]
            ]
        ]