module GameOfLife.View exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import GameOfLife.Model exposing (..)
import GameOfLife.Update exposing (Msg(..))


view : Cell -> Html Msg
view model =
    div []
        [ text (toString model)
        , button
            [ onClick NewGeneration ]
            [ text "Evolve!" ]
        ]
