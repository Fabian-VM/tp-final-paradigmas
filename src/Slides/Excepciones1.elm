module Slides.Excepciones1 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)

codigo : String
codigo = 
    """-- Ya viene predefinido de esta forma
type Maybe a
    = Just a      -- Si existe valor, se retorna Just valor
    | Nothing     -- Si no existe valor, se retorna Nothing

-- USO EN INTÉRPRETE
-- > List.head [10, 20, 30]
-- Just 10 : Maybe number
-- 
-- > List.head []
-- Nothing : Maybe a"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "7. Manejo de errores y excepciones" ]

        , p []
            [ text "No posee excepciones ni mecanismos de control como try-catch. Tampoco valores nulos ni undefined." ]

        , p []
            [ text "Define tipos de datos de unión discriminada \"Maybe\" y \"Result\"." ]

        , p []
            [ text "\"Maybe\" puede representar valor o ausencia de valor." ]

        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]