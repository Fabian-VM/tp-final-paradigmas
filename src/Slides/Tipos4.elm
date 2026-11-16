module Slides.Tipos4 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """-- Se pueden usar incluso sobre tipos simples
type alias Id = Int
type alias Nombre = String
type alias Animal = { id : Id, nombre : Nombre, meses : Int }
type alias ImpresorAnimal = Animal -> String

-- También se pueden usar directamente en prototipos
mostrarAnimal : ImpresorAnimal
mostrarAnimal animal = "Animal N° " ++ String.fromInt animal.id
"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "4. Tipos de datos" ]

        , p []
            [ text "Permite definir aliases de tipos." ]
        
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]