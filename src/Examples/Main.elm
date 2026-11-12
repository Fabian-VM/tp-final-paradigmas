module Examples.Main exposing (..)

-- TIPOS DE DATOS

-- Constrained data types

add : number -> number -> number
add x y = x + y

-- UNIDADES (FUNCIONES)

-- Versión Haskell
-- vfilter :: (a -> Bool) -> [a] -> [b]
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


-- ETC

-- Pipes
-- [1,2,3] |> List.map ((*)2) |> List.filter ((>)3)
-- List.filter ((>)3) <| [1,2,3] 

-- Composicion
-- >>
-- <<

