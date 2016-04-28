module Views.EntryList (entryListView) where

import Html exposing (..)
import Html.Attributes exposing (..)

import Views.EntryListItem exposing (entryListItemView)
import Views.TotalListItem exposing (totalListItemView)

import Models.BingoTerm exposing (BingoTerm)

totalPoints : List BingoTerm -> Int
totalPoints entries =
  entries
    |> List.filter .wasSpoken
    |> List.foldl (\entry sum -> sum + entry.points) 0


entryListView address listItems =
  let
    -- get a list of all possible phrases
    getListItems = List.map (entryListItemView address) listItems
    -- create the totalListItem html view, passing in the total number of points
    totalListItem = totalListItemView (totalPoints listItems)
    -- append the total li element to the list of phrases
    listItemsAndTotal = getListItems ++ [ totalListItem ]
  in
    ul [] listItemsAndTotal
