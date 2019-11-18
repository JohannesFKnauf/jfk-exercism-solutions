module SumOfMultiplesBenchmark exposing (..)

import Benchmark
import Benchmark.Runner

import SumOfMultiples
import SumOfMultiplesSimple
import SumOfMultiplesGenerative

main =
    Benchmark.Runner.program <|
        Benchmark.describe "Sum of Multiples Algorithms" [
             Benchmark.describe "Small l, big n" [
                  Benchmark.describe "[3, 5] 100" [
                       Benchmark.benchmark "Gauss" <|
                           \_ -> SumOfMultiples.sumOfMultiples [3, 5] 100
                      , Benchmark.benchmark "Simple" <|
                           \_ -> SumOfMultiplesSimple.sumOfMultiples [3, 5] 100
                      , Benchmark.benchmark "Generative" <|
                           \_ -> SumOfMultiplesGenerative.sumOfMultiples [3, 5] 100
                      ]
                 , Benchmark.describe "[3, 5] 1000" [
                       Benchmark.benchmark "Gauss" <|
                           \_ -> SumOfMultiples.sumOfMultiples [3, 5] 1000
                      ]
                 , Benchmark.describe "[3, 5] 10000" [
                       Benchmark.benchmark "Gauss" <|
                           \_ -> SumOfMultiples.sumOfMultiples [3, 5] 10000
                      ]
                 , Benchmark.describe "[3, 5] 100000" [
                       Benchmark.benchmark "Gauss" <|
                           \_ -> SumOfMultiples.sumOfMultiples [3, 5] 100000
                      ]
                 ]
             , Benchmark.describe "l=1, big n" [
                  Benchmark.describe "[89] 100" [
                       Benchmark.benchmark "Gauss" <|
                           \_ -> SumOfMultiples.sumOfMultiples [89] 100
                      , Benchmark.benchmark "Simple" <|
                           \_ -> SumOfMultiplesSimple.sumOfMultiples [89] 100
                      , Benchmark.benchmark "Generative" <|
                           \_ -> SumOfMultiplesGenerative.sumOfMultiples [89] 100
                      ]
                 , Benchmark.describe "[89] 100" [
                       Benchmark.benchmark "Gauss" <|
                           \_ -> SumOfMultiples.sumOfMultiples [89] 100
                      ]
                 , Benchmark.describe "[89] 100000" [
                       Benchmark.benchmark "Gauss" <|
                           \_ -> SumOfMultiples.sumOfMultiples [89] 100000
                      ]
                 ]
            , Benchmark.describe "big l, small n" [
                  Benchmark.describe "[2, 3, 8, 9, 13, 17, 21, 24, 89] 100" [
                       Benchmark.benchmark "Gauss" <|
                           \_ -> SumOfMultiples.sumOfMultiples [2, 3, 8, 9, 13, 17, 21, 24, 89] 100
                      , Benchmark.benchmark "Simple" <|
                           \_ -> SumOfMultiplesSimple.sumOfMultiples [2, 3, 8, 9, 13, 17, 21, 24, 89] 100
                      , Benchmark.benchmark "Generative" <|
                           \_ -> SumOfMultiplesGenerative.sumOfMultiples [2, 3, 8, 9, 13, 17, 21, 24, 89] 100
                      ]
                 , Benchmark.describe "[2, 3, 8, 9, 13, 17, 21, 24, 89, 353, 354] 1000" [
                       Benchmark.benchmark "Gauss" <|
                           \_ -> SumOfMultiples.sumOfMultiples [2, 3, 8, 9, 13, 17, 21, 24, 89, 353, 354] 1000
                      , Benchmark.benchmark "Simple" <|
                           \_ -> SumOfMultiplesSimple.sumOfMultiples [2, 3, 8, 9, 13, 17, 21, 24, 89, 353, 354] 1000
                      ]
                 ]
            ]

