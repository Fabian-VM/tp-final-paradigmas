module Slides.Sintaxis1 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """-- Versión Haskell
describir :: String -> String
describir []  = "El texto está vacío"
describir [_] = "El texto tiene un carácter"
describir _   = "El texto tiene muchos caracteres"

-- Versión Elm
describir : String -> String
describir texto =
    let
        largo = String.length texto
    in
    case largo of
        0 -> "El texto está vacío"
        1 -> "El texto tiene un carácter"
        _ -> "El texto tiene muchos caracteres"
"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "5. Sintaxis" ]

        , p []
            [ text "La selección sólo puede hacerse con case-of, la declaración de variables y funciones locales sólo con let-in" ]
        
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]