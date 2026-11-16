module Slides.Example exposing (view)

import Html exposing (Html, code, div, h1, pre, text)
import Html.Attributes exposing (class)

codigo : String
codigo =
    """vmap : (a -> b) -> List a -> List b
vmap f list =
    case list of
        [] ->
            []

        x :: xs ->
            f x :: vmap f xs


-- Ejemplo de uso
vmap (\\x -> x * 2) [1, 2, 3]

-- Resultado: [2, 4, 6]"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "Ejemplo de código" ]
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]