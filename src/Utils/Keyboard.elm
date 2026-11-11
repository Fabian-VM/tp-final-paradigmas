module Utils.Keyboard exposing (..)

import Browser.Events
import Json.Decode as Decode


subscriptions : msg -> msg -> msg -> Sub msg
subscriptions next previous noOp =
    Browser.Events.onKeyDown
        (Decode.map
            (keyToMsg next previous noOp)
            (Decode.field "key" Decode.string)
        )


keyToMsg : msg -> msg -> msg -> String -> msg
keyToMsg next previous noOp key =
    case key of
        "ArrowRight" ->
            next

        "ArrowDown" ->
            next

        "ArrowUp" ->
            previous

        "ArrowLeft" ->
            previous

        _ ->
            noOp