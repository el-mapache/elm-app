-- Define the app's namespace
module Bingo where

-- Libraries
import Definitions
import Html
import StartApp.Simple as StartApp

-- View describing the entire app structure
import Views.App exposing (appView)
-- Model describing the structure of each bingo term to be shown
import Models.BingoTerm exposing (BingoTerm)
import Models.NewBingoTerm exposing (NewBingoTerm)

import Actions.BingoTermAction exposing (..)


-- begin to separate the view logic from the data.
-- app could now receive data from another source, like the server
appState : Definitions.AppState
appState = {
  entries = [
    BingoTerm "Future-Proof" 100 False 1,
    BingoTerm "Disrupt" 150 False 2,
    BingoTerm "We're Agile" 500 False 3,
    BingoTerm "Rockstar Ninja" 350 False 4,
    BingoTerm "Thought Leader" 250 False 5
  ],
  bingoItemInput = NewBingoTerm "" ""}

update : BingoTermAction -> Definitions.AppState -> Definitions.AppState
update action model =
  case action of
    NoOp ->
      model
    Sort ->
      { model | entries =  List.sortBy .points model.entries }
    Delete id ->
      let
        getRemainingEntries =
          -- annonymous functions follow this goofy syntax (\varName -> body)
          List.filter (\entry -> entry.id /= id) model.entries
      in
        { model | entries = getRemainingEntries }
    Mark id ->
      let
        updateEntry entry =
          if entry.id == id
            then { entry | wasSpoken = (not entry.wasSpoken) }
            else entry
      in
        { model | entries = List.map updateEntry model.entries }

-- I think all elm programs have to start with a main function
main : Signal Html.Html
main =
  StartApp.start
    { model = appState,
      view = appView,
      update = update
    }
