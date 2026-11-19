module Slides.Tipos6 exposing (view)

import Html exposing (Html, div, h1, p, text, b, li, ul)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "4. Tipos de datos" ]
        , p []
            [ text "Su sistema de tipos es deliberadamente minimalista:" ]

        , ul []
            [ li []
                [ b [] [ text "Tiempo de chequeo: " ]
                , text "Tipado estático, la ligadura de tipos y el chequeo se realizan en compilación."
                ]

            , li []
                [ b [] [ text "Reglas de equivalencia: " ]
                , text "Por nombre, declaración y estructura."
                ]

            , li []
                [ b [] [ text "Reglas de coerción: " ]
                , text "No posee reglas de coerción, las conversiones deben hacerse explícitamente."
                ]

            , li []
                [ b [] [ text "Inferencia de tipos: " ]
                , text "Posee inferencia de tipos, las anotaciones de tipos no son obligatorias."
                ]

            , li []
                [ b [] [ text "Nivel de polimorfismo: " ]
                , text "Únicamente polimorfismo universal paramétrico para permitir tipos de datos estructurados flexibles."
                ]
            ]

        , p []
            [ text "Es un lenguaje fuertemente tipado." ]
        ]