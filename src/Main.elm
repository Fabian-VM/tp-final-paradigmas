module Main exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)



-- Nuestros módulos
import Slides.Constants
import Utils.Keyboard





-- MODEL

-- Bandera del número de diapositiva
type alias Model =
    { currentSlide : Int
    }

-- Acciones de la diapositiva
type Msg
    = Next
    | Previous
    | NoOp


init : () -> (Model, Cmd Msg)
init _ =
    ( { currentSlide = Slides.Constants.first_slide }, Cmd.none )


-- UPDATE

-- Suscribirse a eventos del teclado (las flechas)
subscriptions : Model -> Sub Msg
subscriptions _ =
    Utils.Keyboard.subscriptions Next Previous NoOp


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Next ->
            ( { model | currentSlide = min Slides.Constants.last_slide (model.currentSlide + 1) }
            , Cmd.none
            )

        Previous ->
            ( { model | currentSlide = max Slides.Constants.first_slide (model.currentSlide - 1) }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )



-- VIEW

view : Model -> Html Msg
view model =
    div
        [ style "font-family" "Arial, sans-serif"
        , style "padding" "40px"
        ]
        [ div
            [ style "display" "flex"
            , style "justify-content" "space-between"
            , style "align-items" "center"
            , style "margin-top" "30px"
            ]
            [ text
                (String.fromInt (model.currentSlide)
                    ++ " / " 
                    ++ String.fromInt(Slides.Constants.last_slide )
                )
            ]
        , div
            [ style "min-height" "350px" ]
            [ Slides.Constants.getSlide model.currentSlide ]
        ]



-- MAIN

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }

