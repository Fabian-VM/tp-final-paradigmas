module Slides.Constants exposing (..)

import Html exposing (Html, text)

import Slides.Portada
import Slides.Implementacion
import Slides.Introduccion
import Slides.Paradigmas
import Slides.Tipos1
import Slides.Tipos3
import Slides.Tipos6
import Slides.Sintaxis1
import Slides.FlujoEjecucion1
import Slides.FlujoEjecucion2
import Slides.Excepciones1
import Slides.Excepciones2
import Slides.PlotTwist
import Slides.DesarrolloInterfaces1
import Slides.DesarrolloInterfaces2
import Slides.Comunicacion1
import Slides.Comunicacion2
import Slides.Comunicacion3
import Slides.Comunicacion4
import Slides.CriteriosLenguaje

first_slide : Int
first_slide = 1

last_slide : Int
last_slide = 20

slides : List (Html msg)
slides =
    [ Slides.Portada.view
    , Slides.Introduccion.view
    , Slides.Implementacion.view
    , Slides.Paradigmas.view
    , Slides.Tipos1.view
    , Slides.Tipos3.view
    , Slides.Tipos6.view
    , Slides.Sintaxis1.view
    , Slides.FlujoEjecucion1.view
    , Slides.FlujoEjecucion2.view
    , Slides.Excepciones1.view
    , Slides.Excepciones2.view
    , Slides.PlotTwist.view
    , Slides.DesarrolloInterfaces1.view
    , Slides.DesarrolloInterfaces2.view
    , Slides.Comunicacion1.view
    , Slides.Comunicacion2.view
    , Slides.Comunicacion3.view
    , Slides.Comunicacion4.view
    , Slides.CriteriosLenguaje.view

    ]

getSlide : Int -> Html msg
getSlide index =
    slides
        |> List.drop (index - 1)
        |> List.head
        |> Maybe.withDefault (text "Diapositiva no encontrada")

getProgress : Int -> String
getProgress slideNumber = (String.fromInt slideNumber ++ " / " ++ String.fromInt last_slide)
