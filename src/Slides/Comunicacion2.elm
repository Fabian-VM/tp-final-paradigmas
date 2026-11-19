module Slides.Comunicacion2 exposing (view)

import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "9. Comunicación con el exterior" ]

        , p []
            [ text "El tipo de dato Cmd representa la ejecución de una acción puntual por el runtime, como una petición HTTP." ]

        , p []
            [ text "El tipo de dato Sub representa la declaración de interés por un evento global del navegador, y qué mensaje se debe recibir cuando suceda." ]


        ]