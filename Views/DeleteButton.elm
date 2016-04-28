module Views.DeleteButton (deleteButtonView) where

import Signal exposing (Address)

import Html exposing (button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Actions.BingoTermAction exposing (..)

deleteButtonView : Address BingoTermAction -> Int -> Html.Html
deleteButtonView address id =
  button
    [ class "delete",
      onClick address (Delete id)
    ]
    [text ""]
