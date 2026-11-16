module Examples.Main exposing (..)

-- TIPOS DE DATOS

-- Constrained data types

-- add : number -> number -> number
-- add x y = x + y

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

procesar : List Int -> List Int

-- procesar numeros = (List.map ((*)10) >> List.filter ((>)10)) numeros
-- procesar [1,2,3,4] -> []

-- procesar numeros = (List.map ((*)10) << List.filter ((>)10)) numeros
-- procesar [1,2,3,4] -> [10,20,30,40]

-- procesar numeros = 
--     numeros 
--     |> List.filter ((>)10)
--     |> List.map ((*)10)
-- procesar [1,2,3,4] -> [10,20,30,40]

procesar numeros = 
    List.map ((*)10) <| List.filter ((>)10) numeros
-- procesar [1,2,3,4] -> []


type EstadoPedido =
    Pagado
    | Enviado 
    | PagoRechazado String
    | EnvioCancelado String

-- el case of es de seguridad exhaustiva
-- no tiene facilidades para ir a un bloque de codigo ante 2 valores (hay que repetir codigo o delegar a otra funcion)
describir : EstadoPedido -> String
describir estado = 
    case estado of
        Pagado -> "Éxito"
        Enviado -> "Éxito" 
        PagoRechazado descripcion -> "Fracaso: " ++ descripcion
        EnvioCancelado descripcion -> "Fracaso: " ++ descripcion

-- describir Pagado -> Éxito
-- describir (EnvioCancelado "El envio fue cancelado") -> "El envio fue cancelado"


valor1 : Float
valor1 = 1.1

valor2 : Int
valor2 = 2

add : Float -> Float -> Float
add x y = x + y

-- add 1.1 2 -> 3.1 no falla porque en el interprete los números aún son de tipo "number", luego los infiere como Float y es válido
-- add valor1 valor2 -> no permite aplicar la operación en el intérprete, o si se compilara daria error


type alias Id = Int
type alias Nombre = String
type alias Animal =
    { id : Id
    , nombre : Nombre
    , meses : Int
    }

-- Para probar las reglas de equivalencia
type alias Animal2 = 
    { id : Int
    , nombre : String
    , meses : Id
    }

type alias ImpresorAnimal = Animal -> String
mostrarAnimal : ImpresorAnimal

mostrarAnimal animal = 
    "Animal N° " ++ String.fromInt animal.id ++ 
    " llamado " ++ animal.nombre ++ 
    " tiene " ++ String.fromInt animal.meses ++ 
    " meses"
-- mostrarAnimal { id = 1, nombre = "michi", meses = 24 } -> "Animal N° 1 llamado michi tiene 24 meses" 
-- mostrarAnimal ( Animal 1 "michi" 24 )
-- mostrarAnimal ( Animal2 1 "michi" 24 )

sinTexto : String -> String
sinTexto texto =
    let
        largo = String.length texto
    in
    case largo of
        0 -> "El texto está vacío"
        _ -> "El texto no está vacío"

