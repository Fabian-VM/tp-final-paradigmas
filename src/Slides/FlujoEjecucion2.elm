module Slides.FlujoEjecucion2 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """describirNota : Int -> String
describirNota nota =
    case nota of
        10 -> "Excelente" 
        9  -> “Muy bien” -- No es posible agrupar casos
        8  -> “Muy bien”
        7  -> “Bien”
        6  -> "Bien"
        _  -> "Regular" -- En compilación se verifica contemplar todos los casos
"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "6. Flujo de ejecución" ]

        , p []
            [ text "No posee herramientas para el manejo explícito de concurrencia, por ejemplo mediante hilos." ]

        , p []
            [ text "Únicamente brinda selección mediante if-then-else y case-of." ]

        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]