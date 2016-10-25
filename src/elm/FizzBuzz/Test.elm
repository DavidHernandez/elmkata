module FizzBuzz.Test exposing (all)

import ElmTest exposing (..)
import FizzBuzz.Update exposing (fizzBuzz)


returnsNumberWhenNotMultipleOf3Or5 : Test
returnsNumberWhenNotMultipleOf3Or5 =
    suite "it should return the number when it's not multiple of 3 or 5"
        [ test "1 is 1"
            (assertEqual "1" (fizzBuzz "1"))
        , test "4 is 4"
            (assertEqual "4" (fizzBuzz "4"))
        ]


returnsFizzWhenMultipleOf3 : Test
returnsFizzWhenMultipleOf3 =
    suite "it should return 'Fizz' when it's a multiple of 3"
        [ test "3 is Fizz"
            (assertEqual "fizz" (fizzBuzz "3"))
        , test "6 is Fizz"
            (assertEqual "fizz" (fizzBuzz "6"))
        ]


returnsBuzzWhenMultipleOf5 : Test
returnsBuzzWhenMultipleOf5 =
    suite "it should return 'Buzz' when it's a multiple of 5"
        [ test "5 is Buzz"
            (assertEqual "buzz" (fizzBuzz "5"))
        , test "10 is Buzz"
            (assertEqual "buzz" (fizzBuzz "10"))
        ]


returnsFizzBuzzWhenMultipleOf5And3 : Test
returnsFizzBuzzWhenMultipleOf5And3 =
    suite "it should return 'FizzBuzz' when it's a multiple of 3 and 5"
        [ test "15 is FizzBuzz"
            (assertEqual "fizzbuzz" (fizzBuzz "15"))
        , test "30 is FizzBuzz"
            (assertEqual "fizzbuzz" (fizzBuzz "30"))
        ]


all : Test
all =
    suite "FizzBuzz tests"
        [ returnsNumberWhenNotMultipleOf3Or5
        , returnsFizzWhenMultipleOf3
        , returnsBuzzWhenMultipleOf5
        , returnsFizzBuzzWhenMultipleOf5And3
        ]
