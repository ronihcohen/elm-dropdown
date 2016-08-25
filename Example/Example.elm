import Html.App as App
import Dropdown as Dropdown


main : Program Never
main =
    App.beginnerProgram {
        model = Dropdown.init "" ["2", "3", "4"] "Your age",
        view = Dropdown.view,
        update = Dropdown.update
    }