module Examples.Pila exposing ( Pila, new, push, size)

-- Tipo opaco Pila: solo se muestra el tipo Pila, pero la lista que contiene no 
type Pila a = Pila (List a)

new : Pila a
new = Pila []

push : a -> Pila a -> Pila a
push elemento (Pila lista) = Pila (elemento :: lista)

size : Pila a -> Int
size (Pila lista) =
    List.length lista