module Slides.Implementacion exposing (view)

import Html exposing (Html, div, h1, li, p, ol, text)
import Html.Attributes exposing (class)

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "Implementacion" ]

        , p []
            [ text "Es un lenguaje compilado (transpilado) a Javascript" ]

        , p []
            [ text "Su proceso de compilación consiste en las siguientes etapas:" ]

        , ol []
            [ li [] [ text "Parseo: generación de árbol sintáctico, se mantiene y refina en todo el proceso" ]
            , li [] [ text "Canonicalización: alcances y ámbitos de referenciamiento, orden de declaraciones, detección de colisiones" ]
            , li [] [ text "Inferencia: definición de tipos, chequeos de tipos" ]
            , li [] [ text "Validación semántica: verificación de lógica del código (ejemplo: case-of)" ]
            , li [] [ text "Optimización global: eliminar código muerto" ]
            , li [] [ text "Generación de código: traducción del árbol a Javascript" ]
            ]
        ]
