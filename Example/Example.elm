module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Dropdown as Dropdown


main : Program Never Dropdown.Dropdown Dropdown.Msg
main =
    Html.beginnerProgram
        { model = Dropdown.init "" [ "apple", "banana", "strawberry" ] "Your favorite fruit"
        , view = view
        , update = Dropdown.update
        }



-- VIEW


view : Dropdown.Dropdown -> Html Dropdown.Msg
view model =
    div
        [ style divStyles
        ]
        [ node "link"
            [ rel "stylesheet"
            , href "../Dropdown.css"
            ]
            []
        , Dropdown.renderDropdownHtml model
        , p
            [ style paragraphStyles
            ]
            [ text ("Selected value: " ++ (Dropdown.getValue model))
            ]
        ]



-- OTHER


divStyles : List ( String, String )
divStyles =
    [ ( "margin", "20px 0 0 20px" )
    ]


paragraphStyles : List ( String, String )
paragraphStyles =
    [ ( "margin", "10px 0 0" )
    , ( "font-family", "sans-serif" )
    , ( "font-size", "14px" )
    ]
