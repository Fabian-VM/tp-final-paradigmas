module Slides.Example exposing (view)

import Html exposing (Html, code, div, h1, pre, text)
import Html.Attributes exposing (style)

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
    div
        [ style "padding" "30px" ]
        [ h1 [] [ text "Ejemplo de código" ]
        , pre
            [ style "background-color" "#1e1e1e"
            , style "color" "#d4d4d4"
            , style "padding" "25px"
            , style "border-radius" "10px"
            ]
            [ code [] [ text codigo ] ]
        ]