import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App
import Html.Events exposing (..)


main : Program Never
main =
    App.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Model =
    {
        value : String,
        isOpen : Bool
    }

model : Model
model =
    Model "" False


-- UPDATE
type Msg = DropdownValue String

update : Msg -> Model -> Model
update msg model =
    case msg of
        DropdownValue value -> { model | value = value }


-- VIEW
view : Model -> Html Msg
view model =
    renderDropdownHtml [1, 2, 3]


-- OTHER
renderDropdownHtml : List valuesList -> Html Msg
renderDropdownHtml valuesList =
    div
    [
        class "elm-dropdown"
    ]
    [
        renderDropdownValueHtml,
        renderDropdownListHtml valuesList
    ]

renderDropdownValueHtml : Html node
renderDropdownValueHtml =
    div
    [
        class "elm-dropdown__value"
    ]
    [
        text ("Value: " ++ model.value)
    ]

renderDropdownListHtml : List valuesList -> Html Msg
renderDropdownListHtml valuesList =
    ul
    [
        class "elm-dropdown__list"
    ]
    (
        List.map (\val -> 
            li
            [
                class "elm-dropdown__list__item",
                onClick (DropdownValue (toString val))
            ]
            [
                text (toString val)
            ]
        ) valuesList
    )
