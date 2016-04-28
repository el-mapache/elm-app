module Models.BingoTerm where

-- type aliases define a custom type for annotations and also provide a free
-- constructor function
type alias BingoTerm =
  { phrase: String,
    points: Int,
    wasSpoken: Bool,
    id: Int
  }
