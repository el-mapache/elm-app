{-
  Elm has a number of functions to help with generating html elements.
  These functions generally take two arguments (2 lists), one for attributes,
  and one for child elements. The html functions return virtual DOM elements.
-}

-- note: every element in an elm list must share the same type

module Views.App (appView) where
{-
  Syntax to import all function from a module. This does make the code less
  explicit.
  Importing specific functions from a module is called an
  'unqualified import'.
-}
import Html exposing (..)
import Html.Attributes exposing (..)

import Views.EntryList exposing (entryListView)
import Views.SortButton exposing (sortButtonView)

import Actions.BingoTermAction exposing (..)

import Definitions

-- a function.
pageHeader : String -> Html
pageHeader title =
  let
    attributes = [ ]
    children = [
      Html.h1 [ ] [ Html.text title ]
    ]
  in
    Html.header attributes children

-- A block of reusable code that takes no args is a definition
pageFooter : Html
pageFooter =
  Html.footer []
    [
      a [
          href "http://availableforfriendship.com",
          attribute "target" "_blank"
        ]
        [ Html.text "More over here!" ]
    ]

appView : Signal.Address BingoTermAction -> Definitions.AppState -> Html
appView address appState =
  {-
    all element functions take two arguments, a list of attributes, and
    a list of child elements. All child elements must be valid html elements,
    i. e. functions that return an html element or virtual DOM node
  -}
  Html.div
    [ id "container" ]
    [
      pageHeader "bingo!",
      entryListView address appState.entries,
      -- pass a copy of the entries to the sort view as well
      sortButtonView address,
      pageFooter
    ]
