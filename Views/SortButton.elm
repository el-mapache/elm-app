
module Views.SortButton (sortButtonView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Actions.BingoTermAction exposing (..)

sortButtonView address =
  button
    [ class "btn btn-sort", onClick address Sort ]
    [ text "Sort" ]
