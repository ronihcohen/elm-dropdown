module Dropdown.DefaultStyles exposing (..)


dropdownStyles : List (String, String)
dropdownStyles =
    [
        ("position", "relative"),        
        ("width", "200px"),
        ("height", "30px"),
        ("outline", "none")
    ]

dropdownCaretStyles : List (String, String)
dropdownCaretStyles =
    [
        ("position", "absolute"),        
        ("width", "0"),
        ("height", "0"),
        ("top", "calc(50% - 2px)"),
        ("right", "10px"),
        ("border-left", "4px solid transparent"),
        ("border-right", "4px solid transparent"),        
        ("border-top", "4px solid #333")
    ]

dropdownClearTextStyles : List (String, String)
dropdownClearTextStyles =
    [
        ("display", "block"),        
        ("position", "absolute"),        
        ("height", "100%"),
        ("right", "28px"),
        ("color", "#333"),
        ("line-height", "30px"),
        ("font-size", "12px")
    ]

dropdownValueStyles : List (String, String)
dropdownValueStyles =
    [
        ("box-sizing", "border-box"),
        ("width", "100%"),
        ("height", "100%"),
        ("background", "#f7f7f7"),
        ("padding", "0 48px 0 10px"),
        ("line-height", "30px"),
        ("font-family", "sans-serif"),
        ("font-size", "14px"),
        ("border", "1px solid #ddd")
    ]

dropdownListStyles : Bool -> List (String, String)
dropdownListStyles isOpen =
    [
        ("box-sizing", "border-box"),        
        ("display", if isOpen then "block" else "none"),
        ("position", "absolute"),
        ("top", "calc(100% + 3px)"),
        ("width", "100%"),
        ("margin", "0"),
        ("padding", "0"),
        ("list-style-type", "none"),        
        ("background", "#fff"),
        ("border", "1px solid #ddd"),
        ("border-width", "1px 1px 0 1px"),
        ("z-index", "1")
    ]

dropdownListItemStyles : List (String, String)
dropdownListItemStyles =
    [
        ("box-sizing", "border-box"),
        ("padding", "0 10px"),                        
        ("height", "30px"),                     
        ("line-height", "30px"),                    
        ("border-bottom", "1px solid #ddd"),
        ("font-family", "sans-serif"),
        ("font-size", "14px")               
    ]