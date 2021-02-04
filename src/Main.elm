module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Invoice exposing (viewInvoice)
import Msg exposing (Model, Invoice, Msg)

view : Model -> Html Msg
view model =
    div []
        [ div [ class "jumbotron" ]
             [ h1 [] [ text "Invoice Processor" ]
             , p []
                 [ text "Let's parse some invoices!" ]
             ]
        , div []
            [ viewInvoice model.mockData ]
        ]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.NoOp ->
            (model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

init : List Invoice -> ( Model, Cmd Msg )
init mockData =
    ( { mockData = mockData }, Cmd.none )

main : Program (List Invoice) Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions }