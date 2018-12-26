module Main exposing (Model, Msg(..), init, initialModel, main, subscriptions, update, view)

import Browser
import Counter
import Element exposing (centerX, column, el, layout, row)
import Gallery
import Html exposing (Html)
import Json.Encode exposing (Value)



-- MODEL


type alias Model =
    { counterModel : Counter.Model
    , galleryModel : Gallery.Model
    }


initialModel : Model
initialModel =
    { counterModel = Counter.initialModel
    , galleryModel = Gallery.initialModel
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel
    , Cmd.none
    )



-- MSG


type Msg
    = CounterMsg Counter.Msg
    | GalleryMsg Gallery.Msg



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        CounterMsg subMsg ->
            let
                ( updatedCounterModel, counterCmd ) =
                    model.counterModel
                        |> Counter.update subMsg
            in
            ( { model
                | counterModel = updatedCounterModel
              }
            , counterCmd
                |> Cmd.map CounterMsg
            )

        GalleryMsg subMsg ->
            let
                ( updatedGalleryModel, galleryCmd ) =
                    model.galleryModel
                        |> Gallery.update subMsg
            in
            ( { model
                | galleryModel = updatedGalleryModel
              }
            , galleryCmd
                |> Cmd.map GalleryMsg
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    let
        galleryView =
            model.galleryModel
                |> Gallery.view
                |> Element.map GalleryMsg
                |> el [ centerX ]

        counterView =
            model.counterModel
                |> Counter.view
                |> Element.map CounterMsg
                |> el [ centerX ]
    in
    [ counterView, galleryView ]
        |> column [ centerX ]
        |> layout []



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
