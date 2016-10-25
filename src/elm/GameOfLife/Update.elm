module GameOfLife.Update exposing (..)

import GameOfLife.Model exposing (..)
import List exposing (filter, length)


type Msg
    = NewGeneration


update : Msg -> Cell -> ( Cell, Cmd Msg )
update msg model =
    case msg of
        NewGeneration ->
            let
                newState =
                    applyGeneration model

                model' =
                    { model | state = newState }
            in
                ( model', Cmd.none )


applyGeneration : Cell -> State
applyGeneration model =
    let
        aliveNeighbours =
            filter (\a -> (a == True)) model.neighbours

        countOfAliveNeighbours =
            length aliveNeighbours
    in
        if countOfAliveNeighbours >= 2 then
            True
        else
            False
