module Views.EntryListItem (entryListItemView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Actions.BingoTermAction exposing (..)
import Views.DeleteButton exposing (deleteButtonView)

entryListItemView address listItem =
  li
    [ classList [ ("bingo-list-item", True), ("highlight", listItem.wasSpoken) ],
      onClick address (Mark listItem.id)
    ]
    [
      span [ class "phrase" ] [ text listItem.phrase ],
      span [ class "points" ] [ text (toString listItem.points) ],
      deleteButtonView address listItem.id
    ]
