import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App
import Dropdown as Dropdown


main : Program Never
main =
    App.beginnerProgram {
        model = Dropdown.init "" ["2", "3", "4"] "Your age",
        view = view,
        update = Dropdown.update
    }


-- VIEW
view : Dropdown.Dropdown -> Html Dropdown.Msg
view model =
    div
    [
        style divStyles
    ]
    [
        Dropdown.renderDropdownHtml model,
        p
        [
            style paragraphStyles
        ]
        [
            text ("Selected value: " ++ (Dropdown.getValue model))
        ]
    ]


-- OTHER
divStyles : List (String, String)
divStyles =
    [
        ("margin", "20px 0 0 20px")               
    ]

paragraphStyles : List (String, String)
paragraphStyles =
    [
        ("margin", "10px 0 0"),
        ("font-family", "sans-serif"),
        ("font-size", "14px")               
    ]