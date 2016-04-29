module Views.NewTermForm (newTermFormView) where

import Html exposing (form, input, text, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onWithOptions, onClick)

import BingoUtils

import Actions.BingoTermAction exposing (..)
import Models.NewBingoTerm exposing (NewBingoTerm)

--newTermFormView : Signal.Address BingoTermAction -> NewBingoTerm -> Html.Html
newTermFormView address model =
  Html.form
    [
      BingoUtils.onFormSubmit address NoOp
    ]
    [
      input [
        -- type is a reserved word, method is type'
        type' "text",
        placeholder "phrase",
        value model.phrase,
        name "phrase",
        autofocus True,
        BingoUtils.onInput address UpdatePhrase
      ] [],
      input [
        type' "text",
        placeholder "points",
        value model.points,
        name "points",
        BingoUtils.onInput address UpdatePoints
      ] [],
      button
        [ class "btn",
          onClick address Add
        ] [ text "Add" ]
    ]
