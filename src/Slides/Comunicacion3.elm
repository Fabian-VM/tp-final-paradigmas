module Slides.Comunicacion3 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)

codigo : String
codigo = 
    """
Código acá

"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "9. Comunicación con el exterior" ]

        , p []
            [ text "El tipo de dato Task representa una operación asíncrona que puede encadenarse, o fallar." ]

        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]