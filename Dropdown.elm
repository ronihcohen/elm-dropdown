module Dropdown exposing (Dropdown, Msg, init, update, view, renderDropdownHtml, getValue)

{-| A customizable Dropdown component.

This Dropdown has a dynamic list of items.

The Dropdown consists of a div containing a value, a caret and a list of
possible values.

See `Examples` folder for further details.

# Definition
@docs Dropdown, Msg

# Init
@docs init

# Update
@docs update

# View
@docs view, renderDropdownHtml

# API
@docs getValue

-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String


-- DROPDOWN MODEL


{-| The Dropdown model.
-}
type alias Dropdown =
    { value : String
    , valuesList : List String
    , placeholder : String
    , isOpen : Bool
    , searchValue : String
    }


{-| Initializing the model.
-}
init : String -> List String -> String -> Dropdown
init initialValue valuesList placeholderValue =
    Dropdown initialValue valuesList placeholderValue False ""



-- UPDATE


{-| Different message types the Dropdown can receive.
-}
type Msg
    = DropdownValue String
    | ToggleDropdown
    | HideDropdown
    | ClearText
    | SearchValue String


{-| Elm architecture reducer.
-}
update : Msg -> Dropdown -> Dropdown
update msg model =
    case msg of
        DropdownValue value ->
            { model | value = value, isOpen = False, searchValue = "" }

        ToggleDropdown ->
            { model | isOpen = not model.isOpen }

        HideDropdown ->
            { model | isOpen = False, searchValue = "" }

        ClearText ->
            { model | value = "" }

        SearchValue value ->
            { model | searchValue = value }



-- VIEW


{-| Dropdown view.
-}
view : Dropdown -> Html Msg
view model =
    renderDropdownHtml model



-- OTHER


{-| Dropdown HTML creator method.
-}
renderDropdownHtml : Dropdown -> Html Msg
renderDropdownHtml model =
    div []
        [ div
            [ class "dropdown-overlay"
            , onClick HideDropdown
            ]
            []
        , div
            [ tabindex -1
            , class
                (if model.isOpen then
                    "elm-dropdown is--opened"
                 else
                    "elm-dropdown"
                )
            ]
            [ renderCaretHtml
            , renderClearTextHtml
            , renderDropdownValueHtml model
            , renderDropdownListHtml model
            ]
        ]


renderCaretHtml : Html Msg
renderCaretHtml =
    span
        [ class "elm-dropdown__caret"
        , onClick ToggleDropdown
        ]
        []


renderClearTextHtml : Html Msg
renderClearTextHtml =
    span
        [ class "elm-dropdown__clear"
        , onClick ClearText
        ]
        [ text "✕"
        ]


renderDropdownValueHtml : Dropdown -> Html Msg
renderDropdownValueHtml model =
    div
        [ class
            (if model.value == "" then
                "elm-dropdown__value is--placeholder"
             else
                "elm-dropdown__value"
            )
        , onClick ToggleDropdown
        ]
        [ text
            (if String.length model.value == 0 then
                model.placeholder
             else
                model.value
            )
        ]


renderDropdownListHtml : Dropdown -> Html Msg
renderDropdownListHtml model =
    ul
        [ class "elm-dropdown__list"
        ]
        ([ li
            [ class "elm-dropdown__list__item"
            ]
            [ input
                [ onInput SearchValue
                , class "elm-dropdown__search"
                , placeholder "Search"
                , value model.searchValue
                ]
                []
            ]
         ]
            ++ (List.filter
                    (\val ->
                        if model.searchValue == "" then
                            True
                        else
                            String.contains model.searchValue val
                    )
                    model.valuesList
                    |> List.map
                        (\val ->
                            li
                                [ class "elm-dropdown__list__item"
                                , onClick (DropdownValue val)
                                ]
                                [ text val
                                ]
                        )
               )
        )



-- API


{-| Get the model value.
-}
getValue : Dropdown -> String
getValue model =
    model.value
