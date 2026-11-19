module Slides.Comunicacion3 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)

codigo : String
codigo = 
    """
Process.sleep 1000
    |> Task.andThen (\\_ -> aplicarCambio desplazamiento model.count)

-- Y en update:
Task.attempt Resultado (tareaCambio desplazamiento model.count)
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