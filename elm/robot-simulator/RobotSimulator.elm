module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )


type Bearing = North
             | East
             | South
             | West


type alias Robot = { bearing : Bearing
                   , coordinates : { x : Int, y : Int }
                   }


defaultRobot : Robot
defaultRobot =
    Robot North { x = 0, y = 0 }

turnRight : Robot -> Robot
turnRight robot =
    case robot.bearing of
        North -> { robot | bearing = East }
        East -> { robot | bearing = South }
        South -> { robot | bearing = West }
        West -> { robot | bearing = North }


turnLeft : Robot -> Robot
turnLeft robot =
    case robot.bearing of
        North -> { robot | bearing = West }
        East -> { robot | bearing = North }
        South -> { robot | bearing = East }
        West -> { robot | bearing = South }


advance : Robot -> Robot
advance robot =
    let
        curCoordinates = robot.coordinates
    in
        case robot.bearing of
            North -> { robot | coordinates = { curCoordinates | y = curCoordinates.y + 1 } }
            East -> { robot | coordinates = { curCoordinates | x = curCoordinates.x + 1 } }
            South -> { robot | coordinates = { curCoordinates | y = curCoordinates.y - 1 } }
            West -> { robot | coordinates = { curCoordinates | x = curCoordinates.x - 1 } }

simulate : String -> Robot -> Robot
simulate directions robot =
    directions
        |> String.foldl execActionCode robot

execActionCode : Char -> Robot -> Robot
execActionCode actionCode =
    case actionCode of
        'L' -> turnLeft
        'R' -> turnRight
        'A' -> advance
        _ -> identity
