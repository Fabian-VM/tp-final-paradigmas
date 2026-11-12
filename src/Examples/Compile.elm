module Examples.Compile exposing (..)
import Html

vsum : List Int -> Int
vsum list =
    case list of
        x :: xs -> x + vsum xs
        [] -> 0


-- Al compilar es necesario que tenga un main
-- El main debe usar la función, de lo contrario no lo incluye en el archivo compilado
main : Html.Html msg
main =
    let result = vsum [1, 2, 3, 4, 5]
    in Html.text (String.fromInt result)
