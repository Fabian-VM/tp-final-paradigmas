module Slides.Comunicacion2 exposing (view)

import Html exposing (Html, div, h1, p, text, pre, code)
import Html.Attributes exposing (class)

codigo : String
codigo = 
    """-- Pedimos el efecto al runtime
fetchPokemon : String -> Cmd Msg
fetchPokemon name =
    Http.get { url = "https://pokeapi.co/api/v2/pokemon/" ++ String.toLower name
        , expect = Http.expectJson PokemonFetched pokemonDecoder }
"""        
codigo2 : String
codigo2 = 
    """-- Si no necesitamos escuchar eventos externos (Sub)
subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
"""

view : Html msg
view =
    div [ class "content-slide" ]
        [ h1 [] [ text "9. Comunicación con el exterior" ]
        , p []
            [ text "El tipo de dato Cmd representa la ejecución de una acción puntual por el runtime, como una petición HTTP." ]
        , p []
            [ text "El tipo de dato Sub representa la declaración de interés por un evento global del navegador, y qué mensaje se debe recibir cuando suceda." ]
        
        , pre [ class "code-example" ]
            [ code [] [ text codigo ] ]

        , pre [ class "code-example" ]
            [ code [] [ text codigo2 ] ]
        ]
