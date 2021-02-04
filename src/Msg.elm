module Msg exposing (Model, Invoice, Msg(..))

type alias Model =
    { mockData : List Invoice }

type alias Invoice =
    { left : Float
    , top : Float
    , width : Float
    , height : Float
    , chars : String
    }


type Msg
    = NoOp