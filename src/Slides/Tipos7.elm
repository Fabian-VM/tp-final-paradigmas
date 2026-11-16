module Slides.Tipos7 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """-- La regla define estáticamente los siguientes tipos posibles para cada uno:
-- number:     Int, Float
-- appendable: String, List a
-- comparable: Int, Float, Char, String, List comparable, Tuple comparable
-- compappend: tipos de datos que sean comparable y appendable a la vez

-- Ejemplo de uso: no es necesario definir para Int y Float por separado
add : number -> number -> number
add x y = x + y
"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "4. Tipos de datos" ]

        , p []
            [ text "Posee variables de tipo restringido para brindar flexibilidad. No son polimorficas por inclusión." ]
        
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]