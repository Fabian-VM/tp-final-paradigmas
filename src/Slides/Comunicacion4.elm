module Slides.Comunicacion4 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)

codigo : String
codigo = 
    """
port module ...

-- Elm -> JS (sale como Cmd)
port saveNote : String -> Cmd msg

-- JS -> Elm (entra como Sub)
port loadNoteReceiver : (String -> msg) -> Sub msg

"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "9. Comunicación con el exterior" ]

        , p []
            [ text "Es posible comunicarse con código de Javascript fuera de Elm, a través de puertos." ]
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]