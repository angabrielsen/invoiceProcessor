module Invoice exposing (viewInvoice)

import Array exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (Model, Invoice, Msg)
import Regex exposing (..)
import String exposing (String)

viewInvoice : Array (List Invoice) -> Html msg
viewInvoice invoices =
    let
        invoice =
            Array.get 0 invoices
            |> Maybe.withDefault
                [   { left = 0
                    , top = 0
                    , width = 0
                    , height = 0
                    , chars = ""
                    }
                ]
    in
    div []
        [ div []
            [ h1 [] [ text  "Invoices" ] ]
        , div [ style "position" "relative" ]
            (List.map viewFields invoice)
        ]

viewFields : Invoice -> Html msg
viewFields invoice =
    let
        left =
            String.fromFloat (invoice.left * 100) ++ "%"

        top =
            String.fromFloat (invoice.top * 1000) ++ "px"

        width =
            String.fromFloat (invoice.width * 100) ++ "%"

        height =
            String.fromFloat (invoice.height * 1000) ++ "%"

        fieldLabel =
            --I'd write a regex here that would identify "invoice" & "#"
            if invoice.chars == "" then
                "Invoice: "
                --|> pipe the remainder of the string to a fieldContent function
            else
                invoice.chars
    in
    div [ style "position" "absolute"
        , style "left" left
        , style "top" top
        , style "width" width
        , style "height" height ]
        [ text  fieldLabel ]