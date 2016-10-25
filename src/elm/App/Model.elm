module App.Model exposing (emptyModel, Model, Page(..))

import FizzBuzz.Model as FizzBuzz
import GameOfLife.Model as GameOfLife


type Page
    = PageNotFound
    | FizzBuzz
    | GameOfLife


type alias Model =
    { activePage : Page
    , fizzbuzz : FizzBuzz.Model
    , gameOfLife : GameOfLife.Cell
    }


emptyModel : Model
emptyModel =
    { activePage = FizzBuzz
    , fizzbuzz = FizzBuzz.emptyModel
    , gameOfLife = GameOfLife.baseCell
    }
