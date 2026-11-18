module Slides.Tipos1 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """-- TIPOS DE DATOS SIMPLES                    -- TIPOS DE DATOS ESTRUCTURADOS

Int     -- 1                                    List    -- [1, 2, 3]
Float   -- 1.1                                  Tuple   -- (1, 'A'), (1, 'A', True)
Bool    -- True, False                          Record  -- { animal = "gato", meses = 30 }
Char    -- 'c'                                  Array   -- Array.fromList [1, 2, 3]
Unit    -- ()                                   Set     -- Set.fromList ['A', 'B', 'C']
Never   -- -                                    Dict    -- Dict.fromList [("id", 25), ("edad", 30)]
Maybe   -- Just a, Nothing
Result  -- Ok a, Err b                          -- TIPOS DE DATOS ABSTRACTOS (TAD)

-- TIPOS DE DATOS DE SECUENCIA                  Cmd     -- Cmd.none
                                                Sub     -- Sub.none
String  -- "Hola"                               Task    -- -
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