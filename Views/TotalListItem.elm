module Views.TotalListItem (totalListItemView) where

import Html exposing (li, span, text)
import Html.Attributes exposing (class)

totalListItemView : Int -> Html.Html
totalListItemView points =
  li
    [ class "total" ]
    [
      span [ class "label " ] [ text "Total" ],
      span [ class "points" ] [ text (toString points) ]
    ]
