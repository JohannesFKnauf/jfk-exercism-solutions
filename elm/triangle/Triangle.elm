module Triangle exposing (..)


version : Int
version =
    2
        
type Triangle = Equilateral
    | Isosceles
    | Scalene
        
triangleKind : number -> number -> number -> Result String Triangle
triangleKind a b c =
    if hasVanishingEdge a b c then (Err "Invalid lengths")
    else if isViolatingEquality a b c then (Err "Violates inequality")
    else if isEquilateral a b c then (Ok Equilateral)
    else if isIsosceles a b c then (Ok Isosceles)
    else (Ok Scalene)

hasVanishingEdge a b c =
    a <= 0 || b <= 0 || c <= 0

isViolatingEquality a b c =
    c > a + b || b > a + c || a > b + c

isEquilateral a b c =
    a == b && b == c

isIsosceles a b c =
    a == b || b == c || a == c