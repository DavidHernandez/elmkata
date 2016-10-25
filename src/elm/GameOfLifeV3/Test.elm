module GameOfLifeV3.Test exposing (..)

import Array
import ElmTest exposing (..)
import GameOfLifeV3.Grid exposing (..)


emptyWorld : Test
emptyWorld =
    let
        emptyWorld =
            Array.repeat 0 9
    in
        test "an empty world"
            (assertEqual emptyWorld (next_generation emptyWorld))


all : Test
all =
    suite "Game of Life tests"
        []
