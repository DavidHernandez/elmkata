module FizzBuzz.Update exposing (..)

import FizzBuzz.Model exposing (Model)
import String exposing (toInt)


type Msg
    = ToFizzBuzz


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToFizzBuzz ->
            let
                model' =
                    fizzBuzz model
            in
                model' ! []


fizzBuzz : Model -> Model
fizzBuzz value =
    let
        value' =
            Result.withDefault 0 (toInt value)

        isMultipleOf3 =
            value' % 3 == 0

        isMultipleOf5 =
            value' % 5 == 0
    in
        if isMultipleOf3 && isMultipleOf5 then
            "fizzbuzz"
        else if isMultipleOf3 then
            "fizz"
        else if isMultipleOf5 then
            "buzz"
        else
            toString value'
