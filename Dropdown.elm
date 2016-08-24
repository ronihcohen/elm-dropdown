import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App
import Html.Events exposing (..)
import Dropdown.DefaultStyles as DefaultStyles


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
type Msg = 
    DropdownValue String | ToggleDropdown

update : Msg -> Model -> Model
update msg model =
    case msg of
        DropdownValue value ->
            { model | value = value }
        ToggleDropdown  ->
            { model | isOpen = not model.isOpen }        


-- VIEW
view : Model -> Html Msg
view model =
    renderDropdownHtml model [1, 2, 3]


-- OTHER
renderDropdownHtml : Model -> List valuesList -> Html Msg
renderDropdownHtml model valuesList =
    div
    [
        class "elm-dropdown",
        style DefaultStyles.dropdownStyles
    ]
    [
        renderDropdownValueHtml model,
        renderDropdownListHtml model valuesList
    ]

renderDropdownValueHtml : Model -> Html Msg
renderDropdownValueHtml model =
    div
    [
        class "elm-dropdown__value",
        style DefaultStyles.dropdownValueStyles,        
        onClick ToggleDropdown
    ]
    [
        text model.value
    ]

renderDropdownListHtml : Model -> List valuesList -> Html Msg
renderDropdownListHtml model valuesList =
    ul
    [
        class "elm-dropdown__list",
        style (DefaultStyles.dropdownListStyles model.isOpen)
    ]
    (
        List.map (\val -> 
            li
            [
                class "elm-dropdown__list__item",
                style DefaultStyles.dropdownListItemStyles,
                onClick (DropdownValue (toString val))
            ]
            [
                text (toString val)
            ]
        ) valuesList
    )