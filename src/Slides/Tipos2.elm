module Slides.Tipos2 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """-- TIPOS DE DATOS ESTRUCTURADOS

List    -- [1, 2, 3]
Tuple   -- (1, 'A'), (1, 'A', True)
Record  -- { animal = "gato", meses = 30 }
Array   -- Array.fromList [1, 2, 3]
Set     -- Set.fromList ['A', 'B', 'C']
Dict    -- Dict.fromList [("id", 25), ("edad", 30)]


-- TIPOS DE DATOS ABSTRACTOS (TAD)

Cmd     -- Cmd.none
Sub     -- Sub.none
Task    -- -
"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "4. Tipos de datos" ]

        , p []
            [ text "Sus tipos de datos predefinidos más importantes" ]
        
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]