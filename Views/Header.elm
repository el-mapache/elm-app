module Views.Header (headerView) where

import Html exposing (h1, text, header)

headerView : String -> Html.Html
headerView title =
  let
    attributes = [ ]
    children = [
      h1 [ ] [ text title ]
    ]
  in
    header attributes children
