module Examples.Main exposing (..)
import Html

-- Versión Haskell
-- vfilter : (a -> Bool) -> [a] -> [b]
-- vfilter _ [] = []
-- vfilter p (x:xs)
--    | p x       = x : vfilter p xs
--    | otherwise = vfilter p xs

-- Versión Elm
vfilter : (a -> Bool) -> List a -> List a
vfilter p list =
    case list of
        x :: xs -> 
            if p x then
                x :: vfilter p xs
            else
                vfilter p xs

        [] -> 
            []

-- Pipes
-- [1,2,3] |> List.map ((*)2) |> List.filter ((>)3)
-- List.filter ((>)3) <| [1,2,3] 

-- Composicion
-- >>
-- <<

-- Al compilar es necesario que tenga un main
-- El main debe usar la función, de lo contrario no lo incluye en el archivo compilado
main : Html.Html msg
main =
    let result = vfilter ((<)2) [1, 2, 3, 4, 5]
    in Html.text (String.fromInt (List.length result))
