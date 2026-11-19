module Slides.Implementacion exposing (view)

import Html exposing (Html, div, h1, li, p, ol, text, b)
import Html.Attributes exposing (class)
view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "2. Implementación" ]

        , p []
            [ text "Es un lenguaje compilado (transpilado) a Javascript." ]

        , p []
            [ text "Su proceso de compilación consiste en las siguientes etapas:" ]

        , ol []
            [ li []
                [ b [] [ text "Parseo: " ]
                , text "generación de árbol sintáctico, que se refina en las siguientes etapas."
                ]

            , li []
                [ b [] [ text "Canonicalización: " ]
                , text "alcances y ámbitos de referenciamiento, orden de declaraciones, detección de colisiones."
                ]

            , li []
                [ b [] [ text "Inferencia: " ]
                , text "definición de tipos, chequeos de tipos."
                ]

            , li []
                [ b [] [ text "Validación semántica: " ]
                , text "verificación de lógica del código (ejemplo: case-of)."
                ]

            , li []
                [ b [] [ text "Optimización global: " ]
                , text "eliminar código muerto."
                ]

            , li []
                [ b [] [ text "Generación de código: " ]
                , text "traducción del árbol a Javascript."
                ]
            ]

        , p []
            [ text "Ejemplo de código compilado." ]

        ]