module App.Update exposing (init, update, Msg(..))

import App.Model exposing (..)
import Config.Model as Config
import FizzBuzz.Update as FizzBuzz exposing (..)
import GameOfLife.Update as GameOfLife exposing (..)


type Msg
    = PageFizzBuzz FizzBuzz.Msg
    | PageGameOfLife GameOfLife.Msg
    | SetActivePage Page
    | SetConfig Config.Model
    | SetConfigError


init : ( Model, Cmd Msg )
init =
    emptyModel ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PageFizzBuzz msg ->
            let
                ( val, cmds ) =
                    FizzBuzz.update msg model.fizzbuzz

                model' =
                    { model | fizzbuzz = val }
            in
                ( model', Cmd.map PageFizzBuzz cmds )

        PageGameOfLife msg ->
            let
                ( val, cmds ) =
                    GameOfLife.update msg model.gameOfLife

                model' =
                    { model | gameOfLife = val }
            in
                ( model', Cmd.map PageGameOfLife cmds )

        SetActivePage page ->
            { model | activePage = page } ! []

        SetConfig config ->
            model ! []

        SetConfigError ->
            model ! []
