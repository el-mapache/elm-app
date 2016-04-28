module Definitions where

import Models.BingoTerm exposing (BingoTerm)
import Models.NewBingoTerm exposing (NewBingoTerm)

type alias AppState =
  {
    entries: List BingoTerm,
    bingoItemInput: NewBingoTerm
  }
