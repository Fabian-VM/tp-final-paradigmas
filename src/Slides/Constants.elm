module Slides.Constants exposing (..)

import Html exposing (Html, text)

import Slides.Concepts
import Slides.Portada
import Slides.Example
import Slides.PlotTwist
import Slides.Architecture
import Slides.Implementacion
import Slides.Introduccion

first_slide : Int
first_slide = 1

last_slide : Int
last_slide = 6

slides : List (Html msg)
slides =
    [ Slides.Portada.view
    , Slides.Introduccion.view
    , Slides.Implementacion.view
    , Slides.Concepts.view
    , Slides.Example.view
    , Slides.PlotTwist.view
    , Slides.Architecture.view
    ]

getSlide : Int -> Html msg
getSlide index =
    slides
        |> List.drop (index - 1)
        |> List.head
        |> Maybe.withDefault (text "Diapositiva no encontrada")

getProgress : Int -> String
getProgress slideNumber = (String.fromInt slideNumber ++ " / " ++ String.fromInt last_slide)
