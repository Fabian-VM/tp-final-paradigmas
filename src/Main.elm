module Main exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Slides.Constants
import Utils.Keyboard exposing (onArrowKeyDownSubscription, onEnterKeyDownSubscription)


-- MAIN

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


-- MODEL

type alias Model = { currentSlide : Int }

init : () -> (Model, Cmd Msg)
init _ = ( { currentSlide = Slides.Constants.first_slide }, Cmd.none )



-- UPDATE

type Msg = Next | Previous | NoOp

subscriptions : Model -> Sub Msg
subscriptions _ = Sub.batch [ 
    onArrowKeyDownSubscription Previous Next Previous Next NoOp,
    onEnterKeyDownSubscription Next NoOp
    ]

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
    div [ class "presentation-container" ]
        [ div [ class "slide-counter" ]
            [ text <| Slides.Constants.getProgress model.currentSlide ]
        , div [ class "slide-container" ]
            [ Slides.Constants.getSlide model.currentSlide ]
        ]
