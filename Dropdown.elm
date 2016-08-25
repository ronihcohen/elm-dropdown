module Dropdown exposing (init, view, update)


import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App
import Html.Events exposing (..)
import Dropdown.DefaultStyles as DefaultStyles
import String


main : Program Never
main =
    App.beginnerProgram {
        model = init "" ["2", "3", "4"] "Your age",
        view = view,
        update = update
    }


-- DROPDOWN MODEL
type alias Dropdown =
    {
        value : String,
        valuesList : List String,        
        placeholder : String,
        isOpen : Bool        
    }

init : String -> List String -> String -> Dropdown
init initialValue valuesList placeholderValue =
    Dropdown initialValue valuesList placeholderValue False


-- UPDATE
type Msg = 
    DropdownValue String | ToggleDropdown | HideDropdown

update : Msg -> Dropdown -> Dropdown
update msg model =
    case msg of
        DropdownValue value ->
            { model | value = value,  isOpen = False }
        ToggleDropdown  ->
            { model | isOpen = not model.isOpen }  
        HideDropdown  ->
            { model | isOpen = False }        


-- VIEW
view : Dropdown -> Html Msg
view model =
    renderDropdownHtml model


-- OTHER
renderDropdownHtml : Dropdown -> Html Msg
renderDropdownHtml model =
    div
    [
        tabindex -1,
        class "elm-dropdown",
        style DefaultStyles.dropdownStyles,
        onBlur HideDropdown
    ]    
    [
        renderCaretHtml,
        renderDropdownValueHtml model,
        renderDropdownListHtml model
    ]

renderCaretHtml : Html Msg
renderCaretHtml =
    span
    [
        style DefaultStyles.dropdownCaretStyles
    ]
    []

renderDropdownValueHtml : Dropdown -> Html Msg
renderDropdownValueHtml model =
    div
    [
        class "elm-dropdown__value",
        style DefaultStyles.dropdownValueStyles,        
        onClick ToggleDropdown
    ]
    [
        text (
            if String.length model.value == 0
                then model.placeholder 
            else 
                model.value
        ) 
    ]

renderDropdownListHtml : Dropdown -> Html Msg
renderDropdownListHtml model =
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
                onClick (DropdownValue val)
            ]
            [
                text val
            ]
        ) model.valuesList
    )