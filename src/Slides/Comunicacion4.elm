module Slides.Comunicacion4 exposing (view)

import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "9. Comunicación con el exterior" ]

        , p []
            [ text "Es posible comunicarse con código de Javascript fuera de Elm, a través de puertos." ]

        ]