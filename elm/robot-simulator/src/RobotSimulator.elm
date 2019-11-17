module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )


type Bearing
    = North
    | East
    | South
    | West


type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }


defaultRobot : Robot
defaultRobot =
    Robot North { x = 0, y = 0 }


simulate : String -> Robot -> Robot
simulate directions robot =
    String.foldl performAction robot directions


performAction : Char -> Robot -> Robot
performAction action =
    case action of
        'L' ->
            turnLeft

        'R' ->
            turnRight

        'A' ->
            advance

        _ ->
            identity


turnRight : Robot -> Robot
turnRight robot =
    let
        rightOf d =
            case d of
                North ->
                    East

                East ->
                    South

                South ->
                    West

                West ->
                    North
    in
    { robot | bearing = rightOf robot.bearing }


turnLeft : Robot -> Robot
turnLeft robot =
    let
        leftOf d =
            case d of
                North ->
                    West

                East ->
                    North

                South ->
                    East

                West ->
                    South
    in
    { robot | bearing = leftOf robot.bearing }


advance : Robot -> Robot
advance robot =
    let
        move coordinates ( dx, dy ) =
            { coordinates | x = coordinates.x + dx, y = coordinates.y + dy }

        towards d =
            case d of
                North ->
                    ( 0, 1 )

                East ->
                    ( 1, 0 )

                South ->
                    ( 0, -1 )

                West ->
                    ( -1, 0 )
    in
    { robot | coordinates = move robot.coordinates <| towards robot.bearing }
