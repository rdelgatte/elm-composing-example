module Gallery exposing (Model, Msg(..), init, initialModel, subscriptions, update, view)

import Browser
import Element exposing (Element, centerX, column, el, layout, padding, px, row, spacing, text, width, wrappedRow)
import Element.Border as Border
import Element.Input as Input
import Html exposing (Html)
import Image exposing (Image, buildImage, randomGenerator)
import Json.Encode exposing (Value)
import Random exposing (generate)
import Task



-- MODEL


type alias Model =
    { images : List Image
    , selected : Maybe Image
    }


initialModel : Model
initialModel =
    { images = []
    , selected = Nothing
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel
    , Cmd.none
    )



-- MSG


type Msg
    = GenerateImageId String
    | LoadedRandomId Int
    | ClickImage Image



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        GenerateImageId _ ->
            ( model
            , randomGenerator 1 500
                |> Random.generate LoadedRandomId
            )

        LoadedRandomId id ->
            ( { model
                | images =
                    [ buildImage id ]
                        |> List.append model.images
              }
            , Cmd.none
            )

        ClickImage image ->
            ( { model
                | selected = Just image
              }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Element Msg
view model =
    let
        images : Element Msg
        images =
            model.images
                |> List.map
                    (\image ->
                        let
                            img =
                                { src = image.url
                                , description = image.description
                                }
                                    |> Element.image [ width (px 100) ]
                        in
                        { onPress = Just (ClickImage image)
                        , label = img
                        }
                            |> Input.button []
                    )
                |> wrappedRow []

        selectedImage : Element Msg
        selectedImage =
            case model.selected of
                Nothing ->
                    text "No image selected" |> el []

                Just image ->
                    { src = image.url
                    , description = image.description
                    }
                        |> Element.image
                            [ padding 10
                            , width (px 500)
                            , centerX
                            ]

        generateButton : Element Msg
        generateButton =
            { onPress = Just (GenerateImageId "1")
            , label = Element.text "Generate an image"
            }
                |> Input.button
                    [ padding 10
                    , spacing 10
                    , centerX
                    ]
    in
    [ images ]
        |> List.append [ generateButton, selectedImage ]
        |> column []
