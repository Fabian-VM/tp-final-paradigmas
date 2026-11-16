module Examples.API exposing (main)

import Browser
import Html exposing (Html, button, div, h1, img, input, li, p, text, ul)
import Html.Attributes exposing (alt, src, placeholder, value)
import Html.Events exposing (onClick, onInput)
import Http
import Json.Decode as Decode exposing (Decoder, field, int, list, string)


-- 1. MODELO Y TIPOS DE DATOS

type alias Pokemon =
    { id : Int
    , name : String
    , imageUrl : String
    , types : List String
    }


type Status
    = Loading
    | Loaded Pokemon
    | Failed Http.Error


type alias Model =
    { pokemon : Status
    , search : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { pokemon = Loading, search = "" }
    , fetchPokemon "bulbasaur"
    )


-- 2. MENSAJES Y UPDATE

type Msg
    = FetchPokemon String
    | PokemonFetched (Result Http.Error Pokemon)
    | SearchChange String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchPokemon name ->
            ( { model | pokemon = Loading }
            , fetchPokemon name
            )

        PokemonFetched (Ok pokemon) ->
            ( { model | pokemon = Loaded pokemon }, Cmd.none )

        PokemonFetched (Err httpError) ->
            ( { model | pokemon = Failed httpError }, Cmd.none )

        SearchChange newtext ->
            ( { model | search = newtext }, Cmd.none )


-- 3. HTTP REQUEST Y DECODIFICADORES

fetchPokemon : String -> Cmd Msg
fetchPokemon name =
    Http.get
        { url = "https://pokeapi.co/api/v2/pokemon/" ++ String.toLower name
        , expect = Http.expectJson PokemonFetched pokemonDecoder
        }


pokemonDecoder : Decoder Pokemon
pokemonDecoder =
    Decode.map4 Pokemon
        (field "id" int)
        (field "name" string)
        imageDecoder
        (field "types" (list typeDecoder))


-- Navega por: sprites -> other -> official-artwork -> front_default

imageDecoder : Decoder String
imageDecoder =
    Decode.at [ "sprites", "other", "official-artwork", "front_default" ] string


-- Navega por cada elemento del array: { "type": { "name": "grass" } }

typeDecoder : Decoder String
typeDecoder =
    Decode.at [ "type", "name" ] string


-- 4. VISTA

view : Model -> Html Msg
view model =
    div []
        [ div []
            [ input
                [ placeholder "Nombre o número del Pokémon"
                , value model.search
                , onInput SearchChange
                ]
                []
            , button [ onClick (FetchPokemon (String.trim model.search)) ] [ text "Buscar" ]
            ]
        , case model.pokemon of
            Loading ->
                p [] [ text "Cargando Pokémon..." ]

            Failed _ ->
                p [] [ text "Error al cargar los datos de la PokéAPI." ]

            Loaded pokemon ->
                div []
                    [ h1 [] [ text ("#" ++ String.fromInt pokemon.id ++ " - " ++ pokemon.name) ]
                    , img [ src pokemon.imageUrl, alt pokemon.name ] []
                    , p [] [ text "Tipos:" ]
                    , ul [] (List.map (\t -> li [] [ text t ]) pokemon.types)
                    ]
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }