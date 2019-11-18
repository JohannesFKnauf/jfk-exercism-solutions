module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict

type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict.Dict Int (List Student)


empty : School
empty =
    Dict.empty


addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    Dict.update grade (addToGradeList student) school

addToGradeList : Student -> Maybe (List Student) -> Maybe (List Student)
addToGradeList student students =
    case students of
        Nothing -> Just <| List.singleton student
        Just xs -> Just <| student::xs
                   

studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    Dict.get grade school
        |> Maybe.withDefault []
        |> List.sort
    

allStudents : School -> List ( Grade, List Student )
allStudents school =
    Dict.keys school
        |> List.sort
        |> List.map (\x -> (x, studentsInGrade x school))
