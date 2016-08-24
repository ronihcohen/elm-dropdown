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
        dropdownStyles
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
        dropdownValueStyles,        
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
        dropdownListStyles model.isOpen
    ]
    (
        List.map (\val -> 
            li
            [
                class "elm-dropdown__list__item",
                dropdownListItemStyles,
                onClick (DropdownValue (toString val))
            ]
            [
                text (toString val)
            ]
        ) valuesList
    )


-- STYLES
dropdownStyles : Attribute msg
dropdownStyles =
    style
    [
        ("position", "relative"),        
        ("width", "200px"),
        ("height", "30px")
    ]

dropdownValueStyles : Attribute msg
dropdownValueStyles =
    style
    [
        ("box-sizing", "border-box"),
        ("width", "100%"),
        ("height", "100%"),
        ("background", "#f7f7f7"),
        ("padding", "0 10px"),
        ("line-height", "30px"),
        ("font-family", "sans-serif"),
        ("font-size", "14px"),
        ("border", "1px solid #ddd")
    ]

dropdownListStyles : Bool -> Attribute msg
dropdownListStyles isOpen =
    style
    [
        ("box-sizing", "border-box"),        
        ("display", if isOpen then "block" else "none"),
        ("position", "absolute"),
        ("top", "calc(100% + 3px)"),
        ("width", "100%"),
        ("margin", "0"),
        ("padding", "0"),
        ("list-style-type", "none"),        
        ("border", "1px solid #ddd"),
        ("border-width", "1px 1px 0 1px")         
    ]

dropdownListItemStyles : Attribute msg
dropdownListItemStyles =
    style
    [
        ("box-sizing", "border-box"),
        ("padding", "0 10px"),                        
        ("height", "30px"),                     
        ("line-height", "30px"),                    
        ("border-bottom", "1px solid #ddd")                    
    ]