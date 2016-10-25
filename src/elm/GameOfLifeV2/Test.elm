module GameOfLifeV2.Test exposing (..)

import ElmTest exposing (..)
import GameOfLifeV2.Model exposing (..)


underpopulationTest : Test
underpopulationTest =
    let
        unit =
            { form = Alive
            , dwellers = 0
            }
    in
        suite "Tests underpopulation"
            [ test "No dwellers and alive"
                (assertEqual Dead (evaluate unit))
            , test "A dwellers and alive"
                (assertEqual Dead (evaluate { unit | dwellers = 1 }))
            ]


survivalTest : Test
survivalTest =
    let
        unit =
            { form = Alive
            , dwellers = 2
            }
    in
        suite "Tests survival"
            [ test "Two dwellers and alive"
                (assertEqual Alive (evaluate unit))
            , test "Three dwellers and alive"
                (assertEqual Alive (evaluate { unit | dwellers = 3 }))
            ]


overcrowdingTest : Test
overcrowdingTest =
    let
        unit =
            { form = Alive
            , dwellers = 4
            }
    in
        suite "Tests overcrowding"
            [ test "Four dwellers and alive"
                (assertEqual Dead (evaluate unit))
            ]


reproductionTest : Test
reproductionTest =
    let
        unit =
            { form = Dead
            , dwellers = 3
            }
    in
        suite "Tests reproduction"
            [ test "Three dwellers and dead"
                (assertEqual Alive (evaluate unit))
            , test "Two dwellers and dead"
                (assertEqual Dead (evaluate { unit | dwellers = 2 }))
            ]


all : Test
all =
    suite "Game of Life tests"
        [ underpopulationTest
        , survivalTest
        , overcrowdingTest
        , reproductionTest
        ]
