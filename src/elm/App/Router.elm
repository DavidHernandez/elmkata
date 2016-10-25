module App.Router exposing (delta2url, location2messages)

import App.Model exposing (..)
import App.Update exposing (..)
import Config exposing (configs)
import Dict exposing (..)
import Navigation exposing (Location)
import RouteUrl exposing (HistoryEntry(..), UrlChange)


delta2url : Model -> Model -> Maybe UrlChange
delta2url previous current =
    case current.activePage of
        FizzBuzz ->
            Just <| UrlChange NewEntry "/#fizzbuzz"

        GameOfLife ->
            Just <| UrlChange NewEntry "/#gameoflife"

        PageNotFound ->
            Just <| UrlChange NewEntry "/#404"


location2messages : Location -> List Msg
location2messages location =
    let
        cmd =
            case location.hash of
                "" ->
                    []

                "#fizzbuzz" ->
                    [ SetActivePage FizzBuzz ]

                "#gameoflife" ->
                    [ SetActivePage GameOfLife ]

                "#404" ->
                    [ SetActivePage PageNotFound ]

                _ ->
                    [ SetActivePage PageNotFound ]
    in
        getConfigFromLocation location :: cmd


getConfigFromLocation : Location -> Msg
getConfigFromLocation location =
    case (Dict.get location.hostname configs) of
        Just val ->
            SetConfig val

        Nothing ->
            SetConfigError
