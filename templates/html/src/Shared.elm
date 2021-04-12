module Shared exposing
    ( Flags
    , Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    , OutMsg(..)
    , handleOutMsgs
    )

import Browser.Navigation exposing (Key)
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Spa.Document exposing (Document)
import Spa.Generated.Route as Route
import Url exposing (Url)


-- INIT


type alias Flags =
    ()


type alias Model =
    { url : Url
    , key : Key
    }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model url key
    , Cmd.none
    )



-- UPDATE


type Msg
    = ReplaceMe

type OutMsg
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


handleOutMsgs : List OutMsg -> Model -> ( Model, Cmd Msg )
handleOutMsgs msgs model =
    List.foldl handleOutMsg ( model, Cmd.none ) msgs


handleOutMsg : OutMsg -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
handleOutMsg outMsg ( model, cmds ) =
    case outMsg of
        ReplaceMe ->
            ( model
            , Cmd.batch
                [ cmds
                , Cmd.none
                ]
            )

-- VIEW


view :
    { page : Document msg, toMsg : Msg -> msg }
    -> Model
    -> Document msg
view { page, toMsg } model =
    { title = page.title
    , body =
        [ div [ class "layout" ]
            [ header [ class "navbar" ]
                [ a [ class "link", href (Route.toString Route.Top) ] [ text "Homepage" ]
                , a [ class "link", href (Route.toString Route.NotFound) ] [ text "Not found" ]
                ]
            , div [ class "page" ] page.body
            ]
        ]
    }
