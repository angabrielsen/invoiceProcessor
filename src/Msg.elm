module Msg exposing (Model, Invoice, Msg(..))

import Array exposing (..)

type alias Model =
    { invoices : Array (List Invoice) }

type alias Invoice =
    { left : Float
    , top : Float
    , width : Float
    , height : Float
    , chars : String
    }

type Msg
    = NoOp