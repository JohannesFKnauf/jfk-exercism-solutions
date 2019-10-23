module Triangle exposing (..)
        
type Triangle = Equilateral
              | Isosceles
              | Scalene
        
triangleKind : number -> number -> number -> Result String Triangle
triangleKind a b c =
    let
        hasVanishingEdge =
            a <= 0 || b <= 0 || c <= 0
        isViolatingEquality =
            c > a + b || b > a + c || a > b + c
        isEquilateral =
            a == b && b == c
        isIsosceles =
            a == b || b == c || a == c
    in
        if hasVanishingEdge then (Err "Invalid lengths")
        else if isViolatingEquality then (Err "Violates inequality")
        else if isEquilateral then (Ok Equilateral)
        else if isIsosceles then (Ok Isosceles)
        else (Ok Scalene)
