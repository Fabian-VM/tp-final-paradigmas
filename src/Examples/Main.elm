module Examples.Main exposing (..)





-- UNION DISCRIMINADA

type EstadoPedido =
  Pagado                  -- Pagado : EstadoPedido
  | Enviado               -- Enviado : EstadoPedido
  | PagoRechazado String  -- <function> String -> PagoRechazado : EstadoPedido
  | EnvioCancelado String -- <function> String -> EnvioCancelado : EstadoPedido

describirEstado : EstadoPedido -> String
describirEstado estado = 
    case estado of
        Pagado  -> "Éxito"
        Enviado -> "Éxito" 
        -- Desempaquetar con pattern matching para armar un mensaje
        PagoRechazado descripcion  -> "Fracaso: " ++ descripcion
        EnvioCancelado descripcion -> "Fracaso: " ++ descripcion






-- ALIASES DE TIPOS

-- Se pueden usar incluso sobre tipos simples
type alias Id = Int
type alias Nombre = String
type alias Animal = { id : Id, nombre : Nombre, meses : Int }
type alias ImpresorAnimal = Animal -> String

-- También se pueden usar directamente en prototipos
mostrarAnimal : ImpresorAnimal
mostrarAnimal animal = "Animal N° " ++ String.fromInt animal.id




-- SISTEMA DE TIPOS

-- La regla define estáticamente los siguientes tipos posibles para cada uno:
-- number:     Int, Float
-- appendable: String, List a
-- comparable: Int, Float, Char, String, List comparable, Tuple comparable
-- compappend: tipos de datos que sean comparable y appendable a la vez

-- Ejemplo de uso: no es necesario definir para Int y Float por separado
add : number -> number -> number
add x y = x + y






-- DEFINICION DE FUNCIONES

-- Versión Haskell es mas elegante
-- describir :: String -> String
-- describir []  = "El texto está vacío"
-- describir [_] = "El texto tiene un carácter"
-- describir _   = "El texto tiene muchos caracteres"

-- Versión Elm
describir : String -> String
describir texto =
    let
        largo = String.length texto
    in
    case largo of
        0 -> "El texto está vacío"
        1 -> "El texto tiene un carácter"
        _ -> "El texto tiene muchos caracteres"


-- REGISTROS EXTENSIBLES
-- Esta función modifica cualquier registro que represente un punto y
-- posea un campo para el valor x, ya sea R2, R3 o RN

moverX : { a | x : Float } -> Float -> { a | x : Float }
moverX punto desfase =  { punto | x = punto.x + desfase }
   


-- SELECCIÓN
describirNota : Int -> String
describirNota nota =
    case nota of
        10 -> "Excelente" 
        9  -> "Muy bien" -- No es posible agrupar casos
        8  -> "Muy bien"
        7  -> "Bien"
        6  -> "Bien"
        _  -> "Regular" -- En compilación se verifica contemplar todos los casos



