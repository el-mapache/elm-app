module BingoUtils where
{-| This modules defines various utility functions for the Bingo app.

These functions involve fairly advanced features of Elm that we don't
delve into during the course.

It's possible that future versions of the Elm core libraries
might provide these functions.
-}
import Json.Decode
import String exposing (toInt)
import Html exposing (Attribute)
import Html.Events exposing (on, onWithOptions, targetValue)
import Signal exposing (Address)

onFormSubmit address action =
  onWithOptions
    "submit"
    { preventDefault = True, stopPropagation = False }
    ( Json.Decode.succeed Nothing )
    (\_ -> Signal.message address action)

onInput : Address a -> (String -> a) -> Attribute
onInput address f =
  on "input" targetValue (\v -> Signal.message address (f v))


parseInt : String -> Int
parseInt string =
  case String.toInt string of
    Ok value ->
      value
    Err error ->
      0
