module Slides.Sintaxis2 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """-- Esta función modifica cualquier registro que represente un punto y
-- posea un campo para el valor x, ya sea R2, R3 o RN
moverX : { a | x : Float } -> Float -> { a | x : Float }
moverX punto desfase =  { punto | x = punto.x + desfase }

-- Uso: 
-- moverX { x = 1, nombre = "michi" } 1

"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "5. Sintaxis" ]

        , p []
            [ text "Una particularidad que no tiene Haskell (nativamente), son los registros extensibles" ]
        
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]