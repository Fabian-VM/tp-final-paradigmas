module Slides.Comunicacion1 exposing (view)

import Html exposing (Html, div, h1, p, text, img)
import Html.Attributes exposing (class, src, width)


view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "9. Comunicación con el exterior" ]

        , p []
            [ text "Nuestras aplicaciones se comunican con el runtime a través de comandos y suscripciones, y el runtime con nuestra aplicación a través de mensajes." ]

        , img 
            [ src "images/runtime-diagram.svg"
            , width 900
            ] 
            []
        ]