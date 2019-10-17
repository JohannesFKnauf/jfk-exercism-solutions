module PhoneNumber exposing (getNumber)

getNumber : String -> Maybe String
getNumber phoneNumber =
    phoneNumber
        |> String.filter Char.isDigit
        |> validateLength
        |> Maybe.andThen validateAreaCode
        |> Maybe.andThen validateExchangeCode

validateLength : String -> Maybe String
validateLength number =
    let
        len = String.length number
    in
        case len of
            10 -> Just number
            11 -> case String.uncons number of
                      Just ('1', rest) -> Just rest
                      _ -> Nothing
            _ -> Nothing

validateAreaCode =
    isDigitGreaterThan2 0

validateExchangeCode =
    isDigitGreaterThan2 3


isDigitGreaterThan2 idx number =
    let
        digitAtIdx = String.slice idx (idx + 1)
    in
        case digitAtIdx number of
            "0" -> Nothing
            "1" -> Nothing
            _ -> Just number
