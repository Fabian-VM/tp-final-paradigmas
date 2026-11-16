module Slides.CriteriosLenguaje exposing (view)

import Html exposing (Html, div, h1, p, text, strong)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "10. Evaluación y conclusión sobre el lenguaje" ]

        , p []
            [ text "Nuestra evaluación del lenguaje:" ]

        , p []
            [ strong [] [ text "Facilidad de lectura: " ]
            , text "Excelente. Su sintaxis es pequeña y ortogonal. Carece de sobrecarga y multiplicidad de servicios."
            ]

        , p []
            [ strong [] [ text "Facilidad de escritura: " ]
            , text "Buena. La inferencia de tipos y la arquitectura TEA facilitan el desarrollo. La inmutabilidad y las limitaciones de polimorfismo pueden requerir más código para algunos problemas."
            ]

        , p []
            [ strong [] [ text "Confiabilidad: " ]
            , text "Excelente. El sistema de tipos, la transparencia referencial y restricciones extras permiten detectar errores en compilación."
            ]

        , p []
            [ strong [] [ text "Costo: " ]
            , text "Depende del proyecto. Puede reducir los costos de mantenimiento y depuración, pero su ecosistema reducido y su aprendizaje pueden incrementar el costo inicial."
            ]
        ]