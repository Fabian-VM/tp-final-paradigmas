module Slides.Portada exposing (view)

import Html exposing (Html, div, h1, text, img, p)
import Html.Attributes exposing (class, src, width)

view : Html msg
view =
    div [ class "title-slide" ]
        [ img 
            [ src "images/logo.png"
            , width 300
            ] 
            []
            ,
        h1 [] [ text "Lenguaje Elm" ]
        , p [] [ text "Un lenguaje funcional orientado al desarrollo de interfaces web."]
        
        ]
