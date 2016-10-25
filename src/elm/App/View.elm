module App.View exposing (..)

import Config.View exposing (view)
import Html exposing (..)
import Html.Attributes exposing (class, classList, href, src, style, target)
import Html.App as Html
import Html.Events exposing (onClick)
import App.Model exposing (..)
import App.Update exposing (..)
import FizzBuzz.View exposing (..)
import GameOfLife.View exposing (..)
import Pages.PageNotFound.View exposing (view)


view : Model -> Html Msg
view model =
    div []
        [ div [ class "ui container main" ]
            [ viewHeader model
            , viewMainContent model
            , pre [ class "ui padded secondary segment" ]
                [ div [] [ text <| "activePage: " ++ toString model.activePage ]
                , div [] [ text <| "fizzbuzz: " ++ toString model.fizzbuzz ]
                , div [] [ text <| "gameOfLife: " ++ toString model.gameOfLife ]
                ]
            ]
        ]


viewHeader : Model -> Html Msg
viewHeader model =
    div [ class "ui secondary pointing menu" ] (navbar model)


navbar : Model -> List (Html Msg)
navbar model =
    [ a
        [ classByPage FizzBuzz model.activePage
        , onClick <| SetActivePage FizzBuzz
        ]
        [ text "Katas" ]
    ]


viewMainContent : Model -> Html Msg
viewMainContent model =
    case model.activePage of
        FizzBuzz ->
            Html.map PageFizzBuzz (FizzBuzz.View.view model.fizzbuzz)

        GameOfLife ->
            Html.map PageGameOfLife (GameOfLife.View.view model.gameOfLife)

        PageNotFound ->
            Pages.PageNotFound.View.view


{-| Get menu items classes. This function gets the active page and checks if
it is indeed the page used.
-}
classByPage : Page -> Page -> Attribute a
classByPage page activePage =
    classList
        [ ( "item", True )
        , ( "active", page == activePage )
        ]
