module Main exposing (..)

import Html exposing (..)
import Types exposing (..)
import Request.Gifs exposing (..)
import Request.Films exposing (..)
import Views.View exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , subscriptions = always Sub.none
        , update = update
        }



-- model


init : ( Model, Cmd Msg )
init =
    ( Model Nothing [] [], getFilms )



-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectCharacter Totoro ->
            ( { model | character = Just "Totoro" }, getGifs Totoro )

        SelectCharacter Chibi ->
            ( { model | character = Just "Chibi" }, getGifs Chibi )

        SelectCharacter NoFace ->
            ( { model | character = Just "NoFace" }, getGifs NoFace )

        UpdateGifUrls (Ok gifUrls) ->
            ( { model | gifUrls = gifUrls }, Cmd.none )

        UpdateGifUrls (Err error) ->
            ( model, Cmd.none )

        UpdateFilms (Ok allFilms) ->
            ( { model | allFilms = allFilms }, Cmd.none )

        UpdateFilms (Err error) ->
            ( model, Cmd.none )
