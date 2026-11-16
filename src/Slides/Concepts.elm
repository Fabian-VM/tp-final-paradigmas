module Slides.Concepts exposing (view)

import Html exposing (Html, div, h1, li, p, ul, text)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "Características de Elm" ]

        , p []
            [ text "Elm es un lenguaje funcional, estáticamente tipado y compilado a JavaScript." ]

        , ul []
            [ li [] [ text "Inmutabilidad" ]
            , li [] [ text "Funciones puras" ]
            , li [] [ text "Inferencia de tipos" ]
            , li [] [ text "Pattern matching" ]
            , li [] [ text "The Elm Architecture" ]
            ]
        ]