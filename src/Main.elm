module Main exposing (Model, Msg(..), init, initialModel, main, subscriptions, update, view)

import Browser
import Counter
import Element exposing (el, layout)
import Html exposing (Html)
import Json.Encode exposing (Value)



-- MODEL


type alias Model =
    { counterModel : Counter.Model }


initialModel : Model
initialModel =
    { counterModel = Counter.initialModel }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel
    , Cmd.none
    )



-- MSG


type Msg
    = WidgetMsg Counter.Msg



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        WidgetMsg subMsg ->
            let
                ( updatedWidgetModel, widgetCmd ) =
                    model.counterModel
                        |> Counter.update subMsg
            in
            ( { model
                | counterModel = updatedWidgetModel
              }
            , widgetCmd
                |> Cmd.map WidgetMsg
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    model.counterModel
        |> Counter.view
        |> Element.map WidgetMsg
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
