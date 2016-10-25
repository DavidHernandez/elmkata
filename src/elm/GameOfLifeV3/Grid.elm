module GameOfLifeV3.Grid exposing (..)

import Array exposing (Array)


type alias Grid =
    Array (Array Tile)


type alias Tile =
    Int


type alias Position =
    { x : Int
    , y : Int
    }


type alias Neighbours =
    Int


next_generation : Grid -> Grid
next_generation grid =
    grid


get_neighbours : Position -> Grid -> Neighbours
get_neighbours position grid =
    let
        neighbours =
            0
    in
        neighbours
