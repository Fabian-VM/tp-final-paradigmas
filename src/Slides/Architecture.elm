module Slides.Architecture exposing (view)

import Html exposing (Html, code, details, div, h1, h3, node, p, pre, summary, text)
import Html.Attributes exposing (attribute, class, style)

-- este es un ejemplo que le pedi a la IA para tener el zoom
-- me di cuenta que si tenemos ejemplos
-- el contendor de bloque de codigo es un propio modulo
view : Html msg
view =
    div
        [ style "padding" "40px"
        , style "font-family" "sans-serif"
        ]
        [ node "style" [] [ text cssZoom ]
        , h1 [ style "margin-bottom" "30px" ] [ text "The Elm Architecture" ]
        , div
            [ style "display" "flex"
            , style "gap" "24px"
            , style "justify-content" "center"
            , style "align-items" "flex-start"
            ]
            [ viewTarjetaZoomable
                "1. Model"
                "El estado único de la aplicación."
                "type alias Model =\n    { contador : Int\n    , usuario : String\n    }"
            , viewTarjetaZoomable
                "2. Update"
                "Función pura que transforma el estado."
                "update : Msg -> Model -> Model\nupdate msg model =\n    ..."
            , viewTarjetaZoomable
                "3. View"
                "Representación visual del estado en HTML."
                "view : Model -> Html Msg\nview model =\n    div [] [ ... ]"
            ]
        ]


viewTarjetaZoomable : String -> String -> String -> Html msg
viewTarjetaZoomable titulo descripcion snippet =
    details [ class "tarjeta-zoom"
    , attribute "name" "arquitectura-cards" 
    ]
        [ summary [ class "tarjeta-resumen" ]
            [ h3 [ style "margin" "0 0 8px 0", style "color" "#1e293b" ] [ text titulo ]
            , p [ style "margin" "0 0 12px 0", style "color" "#475569", style "font-size" "14px" ] [ text descripcion ]
            , pre
                [ style "background" "#f8fafc"
                , style "padding" "10px"
                , style "border-radius" "6px"
                , style "font-size" "12px"
                , style "overflow-x" "auto"
                , style "margin" "0"
                , style "border" "1px solid #e2e8f0"
                ]
                [ code [] [ text snippet ] ]
            ]
        ]


cssZoom : String
cssZoom =
    """
    .tarjeta-zoom {
        border: 1px solid #cbd5e1;
        border-radius: 10px;
        padding: 18px;
        background: #ffffff;
        box-shadow: 0 2px 6px rgba(0,0,0,0.08);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        cursor: zoom-in;
        width: 280px;
        position: relative;
        z-index: 1;
        user-select: none;
    }

    .tarjeta-resumen {
        list-style: none;
    }
    .tarjeta-resumen::-webkit-details-marker {
        display: none;
    }

    .tarjeta-zoom[open] {
        transform: scale(1.5);
        box-shadow: 0 20px 35px rgba(0,0,0,0.25);
        cursor: zoom-out;
        z-index: 50;
    }
    """
