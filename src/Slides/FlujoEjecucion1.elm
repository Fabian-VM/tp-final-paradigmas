module Slides.FlujoEjecucion1 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """-- OPERADORES DE COMPOSICIÓN Y PIPE
-- Todas las expresiones poseen la semántica f (g x)

-- <<  Composición convencional
-- (f << g) x 

-- >>  Composición hacia la derecha 
-- (g >> f) x 

-- |>  Pipe de resultados hacia la derecha
-- x |> g |> f 

-- <|  Pipe de resultados hacia la izquierda
-- f <| g <| x 
"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "6. Flujo de ejecución" ]

        , p []
            [ text "Su evaluación de expresiones es ansiosa." ]

        , p []
            [ text "Brinda operaciones interesantes de composición." ]

        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]