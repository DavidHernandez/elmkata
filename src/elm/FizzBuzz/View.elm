module FizzBuzz.View exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import FizzBuzz.Model exposing (Model)
import FizzBuzz.Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ text (toString model)
        , button
            [ onClick ToFizzBuzz ]
            [ text "ToFizzBuzz!" ]
        , text (toString (6 % 5))
        ]
