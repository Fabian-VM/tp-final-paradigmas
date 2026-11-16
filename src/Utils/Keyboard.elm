module Utils.Keyboard exposing (onArrowKeyDownSubscription, onEnterKeyDownSubscription)

import Browser.Events
import Json.Decode as Decode

-- ASI ES, TODO ESTO SOLO PARA ESCUCHAR LAS FLECHAS Y EL ENTER


-- Obtiene la suscripción para escuchar específicamente la tecla Enter
onEnterKeyDownSubscription : msg -> msg -> Sub msg
onEnterKeyDownSubscription enter noOp =
    Browser.Events.onKeyDown <| buildDecoder (selectEnterMsg enter noOp) keyDecoder

-- Obtiene la suscripción para escuchar teclas direccionales
onArrowKeyDownSubscription : msg -> msg -> msg -> msg -> msg -> Sub msg
onArrowKeyDownSubscription up down left right none =
    Browser.Events.onKeyDown <| buildDecoder (selectArrowMsg up down left right none) keyDecoder

-- Arma otro decodificador, que sea capaz de obtener el nombre de la tecla presionada
-- y transformar eso en un msg
buildDecoder : (String -> msg) -> Decode.Decoder String -> Decode.Decoder msg
buildDecoder keyToMsg readKey = Decode.map keyToMsg readKey

-- Obtiene el decodificador que extrae el campo de tecla presionada
keyDecoder : Decode.Decoder String
keyDecoder = Decode.field "key" Decode.string

-- Selecciona qué valor de msg usar según nombres de teclas direccionales
selectArrowMsg : msg -> msg -> msg -> msg -> msg -> String -> msg
selectArrowMsg up down left right none key =
    case key of
        "ArrowRight" -> right
        "ArrowDown" -> down
        "ArrowUp" -> up
        "ArrowLeft" -> left
        _ -> none

-- Selecciona qué valor de msg usar según si la tecla presionada es Enter
selectEnterMsg : msg -> msg -> String -> msg
selectEnterMsg enter noOp key =
    case key of
        "Enter" -> enter
        _ -> noOp