module Slides.Tipos3 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)


codigo : String
codigo = 
    """type EstadoPedido =
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
"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "4. Tipos de datos" ]

        , p []
            [ text "Permite definir tipos de unión discriminada." ]
        
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]
        ]