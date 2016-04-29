module Actions.BingoTermAction where

type BingoTermAction =
  NoOp
  | Sort
  | Delete Int
  | Mark Int
  | UpdatePhrase String
  | UpdatePoints String
  | Add
