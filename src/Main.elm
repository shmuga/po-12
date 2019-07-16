module Main exposing (Button, Model, Msg(..), buttonView, init, main, update, view)

import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (class, css, src)
import List.Extra as List



---- MODEL ----


type alias Button =
    { sound : String
    , symbol : String
    }


type alias Model =
    { buttons : List Button
    }


init : ( Model, Cmd Msg )
init =
    ( { buttons =
            [ { sound = "13", symbol = "1" }
            , { sound = "13", symbol = "2" }
            , { sound = "13", symbol = "3" }
            , { sound = "13", symbol = "4" }
            , { sound = "13", symbol = "5" }
            , { sound = "13", symbol = "6" }
            , { sound = "13", symbol = "7" }
            , { sound = "13", symbol = "8" }
            , { sound = "13", symbol = "9" }
            , { sound = "13", symbol = "10" }
            , { sound = "13", symbol = "11" }
            , { sound = "13", symbol = "12" }
            , { sound = "13", symbol = "13" }
            , { sound = "13", symbol = "14" }
            , { sound = "13", symbol = "15" }
            , { sound = "13", symbol = "16" }
            ]
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ sequenceButtonsView <| List.greedyGroupsOf 4 model.buttons
        ]


sequenceButtonsView : List (List Button) -> Html Msg
sequenceButtonsView rows =
    div
        [ class "sequence-buttons"
        , css
            [ border3 (px 1) solid (rgb 0 0 0)
            ]
        ]
    <|
        List.map buttonRowView rows


buttonRowView : List Button -> Html Msg
buttonRowView xs =
    div
        [ class "row"
        , css
            [ displayFlex
            , justifyContent center
            ]
        ]
    <|
        List.map buttonView xs


buttonView : Button -> Html Msg
buttonView btn =
    div
        [ class "button"
        , css
            [ borderRadius (pct 50)
            , width (px 40)
            , height (px 40)
            , displayFlex
            , justifyContent center
            , alignItems center
            , cursor pointer
            , hover
                [ border3 (px 1) dashed (rgb 50 50 50)
                ]
            ]
        ]
        [ text btn.symbol ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view >> toUnstyled
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
