module Main exposing (..)

import ElmTest exposing (..)
import App.Test as App exposing (..)
import FizzBuzz.Test as FizzBuzz exposing (..)
import GameOfLife.Test as GameOfLife exposing (..)
import GameOfLifeV2.Test as GameOfLifeV2 exposing (..)
import GameOfLifeV3.Test as GameOfLifeV3 exposing (..)


allTests : Test
allTests =
    suite "All tests"
        [ App.all
        , FizzBuzz.all
        , GameOfLife.all
        , GameOfLifeV2.all
        , GameOfLifeV3.all
        ]


main : Program Never
main =
    runSuiteHtml allTests
