module Views.Footer (footerView) where

import Html exposing (footer, a, text)
import Html.Attributes exposing (href, attribute)

-- A block of reusable code that takes no args is a definition
footerView : Html.Html
footerView =
  footer []
    [
      a [
          href "http://availableforfriendship.com",
          attribute "target" "_blank"
        ]
        [ text "More over here!" ]
    ]
