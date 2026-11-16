module Slides.Tipos1 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """-- TIPOS DE DATOS SIMPLES

Int     -- 1
Float   -- 1.1
Bool    -- True, False
Char    -- 'c'
Unit    -- ()
Never   -- -
Maybe   -- Just a, Nothing
Result  -- Ok a, Err b


-- TIPOS DE DATOS DE SECUENCIA

String  -- "Hola"
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