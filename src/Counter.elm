module Counter exposing (Model, Msg(..), initialModel, update, view)

import Element exposing (Element, centerX, column, el, padding, row, spacing, text)
import Element.Border as Border
import Element.Input as Input
import Html.Events exposing (onClick)



-- MODEL


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 0 }



-- MESSAGES


type Msg
    = Increase
    | Decrease



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Increase ->
            ( { model
                | count = model.count + 1
              }
            , Cmd.none
            )

        Decrease ->
            ( { model
                | count = model.count - 1
              }
            , Cmd.none
            )



-- VIEW


view : Model -> Element Msg
view model =
    let
        increaseButton : Element Msg
        increaseButton =
            { onPress = Just Increase
            , label = text "Increase"
            }
                |> Input.button
                    [ Border.width 1
                    , padding 10
                    ]

        decreaseButton : Element Msg
        decreaseButton =
            { onPress = Just Decrease
            , label = text "Decrease"
            }
                |> Input.button
                    [ Border.width 1
                    , padding 10
                    ]
    in
    [ [ increaseButton, decreaseButton ]
        |> row [ spacing 10 ]
    ]
        |> List.append
            [ text (String.fromInt model.count)
                |> el [ centerX ]
            ]
        |> column
            [ padding 10
            , spacing 10
            ]
