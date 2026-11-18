module Slides.Excepciones2 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)

codigo : String
codigo = 
    """type Result error value
    = Ok value      -- Ante operación normal, se retorna Ok valor
    | Err error     -- Si se declara un error, se retorna Err error"""

codigo2 : String
codigo2 = 
    """> validar : Int -> Result String Int
| validar edad = if edad >= 18 then (Ok edad) else (Err "Es menor de edad")
<function> : number -> Result String number
 
> validar 25
Ok 25 : Result String number

> validar 15
Err "Es menor de edad" : Result String number"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "7. Manejo de errores y excepciones" ]

        , p []
            [ text "Para los errores, predefine un tipo \"Result\" que llevará un valor de éxito y otro de fracaso." ]
            
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]

        , pre [ class "code-example" ]
            [ code [] [ text codigo2 ] ]

        ]

