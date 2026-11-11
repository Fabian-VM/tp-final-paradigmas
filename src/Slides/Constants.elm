module Slides.Constants exposing (..)

import Html exposing (Html, text)

import Slides.Concepts
import Slides.Introduction
import Slides.Example
import Slides.PlotTwist

first_slide : Int
first_slide = 1

last_slide : Int
last_slide = 4

slides : List (Html msg)
slides =
    [ Slides.Introduction.view
    , Slides.Concepts.view
    , Slides.Example.view
    , Slides.PlotTwist.view
    ]

getSlide : Int -> Html msg
getSlide index =
    slides
        |> List.drop (index - 1)
        |> List.head
        |> Maybe.withDefault (text "Diapositiva no encontrada")
