module Examples.Compile exposing (..)
import Html

-- 2. IMPLEMENTACIÓN

-- Elm - Realiza la sumatoria de los números enteros de la lista
vsum : List Int -> Int 
vsum list =
    case list of
        x :: xs -> x + vsum xs
        [] -> 0




-- Ignorar esto
-- Al compilar es necesario que tenga un main
-- El main debe usar la función, de lo contrario no lo incluye en el archivo compilado
main : Html.Html a
main =
    Html.text <| String.fromInt <| vsum [1, 2, 3, 4, 5]
