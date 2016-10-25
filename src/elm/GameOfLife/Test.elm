module GameOfLife.Test exposing (all)

import ElmTest exposing (..)
import GameOfLife.Model exposing (..)
import GameOfLife.Update exposing (..)


whenMapIsEmptyStaysEmpty : Test
whenMapIsEmptyStaysEmpty =
    suite "Tests Game of Life"
        [ test "When the map is empty, stays empty"
            (assertEqual False (applyGeneration baseCell))
        , test "When the map only have one cell, stays empty"
            (assertEqual False (applyGeneration oneNeighbour))
        , test "When the cell 2 neighbours, the cell still alive"
            (assertEqual True (applyGeneration twoNeighbours))
        ]


all : Test
all =
    suite "Game Of Life tests"
        [ whenMapIsEmptyStaysEmpty
        ]
