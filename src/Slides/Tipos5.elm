module Slides.Tipos5 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """-- Tipo opaco Pila: solo se muestra el tipo Pila, pero no el constructor interno
-- Si no se deseara que fuera opaco, se debe exportar como Pila(..)
module Pila exposing ( Pila, new, push, size )

-- “a” es un tipo de dato paramétrico, similar a “[a]” en Haskell
type Pila a = Pila (List a)

new : Pila a
new = Pila []

push : a -> Pila a -> Pila a
push elemento (Pila lista) = Pila (elemento :: lista)

size : Pila a -> Int
size (Pila lista) = List.length lista
"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "4. Tipos de datos" ]

        , p []
            [ text "Permite definir tipos de datos abstractos (TADs) mediante tipos opacos." ]
        
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]