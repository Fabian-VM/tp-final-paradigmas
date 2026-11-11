module Slides.Concepts exposing (view)

import Html exposing (Html, div, h1, li, p, ul, text)
import Html.Attributes exposing (style)


view : Html msg
view =
    div
        [ style "padding" "40px" ]
        [ h1 [] [ text "Características de Elm" ]

        , p []
            [ text "Elm es un lenguaje funcional, estáticamente tipado y compilado a JavaScript." ]

        , ul
            [ style "font-size" "20px"
            , style "line-height" "2"
            ]
            [ li [] [ text "Inmutabilidad" ]
            , li [] [ text "Funciones puras" ]
            , li [] [ text "Inferencia de tipos" ]
            , li [] [ text "Pattern matching" ]
            , li [] [ text "The Elm Architecture" ]
            ]
        ]