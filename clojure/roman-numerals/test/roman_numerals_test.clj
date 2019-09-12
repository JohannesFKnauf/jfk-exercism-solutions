(ns roman-numerals-test
  (:require [clojure.test :refer [deftest is are]]
            roman-numerals))

(deftest one
  (is (= "I" (roman-numerals/numerals 1))))

(deftest two
  (is (= "II" (roman-numerals/numerals 2))))

(deftest three
  (is (= "III" (roman-numerals/numerals 3))))

(deftest four
  (is (= "IV" (roman-numerals/numerals 4))))

(deftest five
  (is (= "V" (roman-numerals/numerals 5))))

(deftest six
  (is (= "VI" (roman-numerals/numerals 6))))

(deftest nine
  (is (= "IX" (roman-numerals/numerals 9))))

(deftest twenty-seven
  (is (= "XXVII" (roman-numerals/numerals 27))))

(deftest forty-eight
  (is (= "XLVIII" (roman-numerals/numerals 48))))

(deftest fifty-nine
  (is (= "LIX" (roman-numerals/numerals 59))))

(deftest ninety-three
  (is (= "XCIII" (roman-numerals/numerals 93))))

(deftest one-hundred-forty-one
  (is (= "CXLI" (roman-numerals/numerals 141))))

(deftest one-hundred-sixty-three
  (is (= "CLXIII" (roman-numerals/numerals 163))))

(deftest four-hundred-two
  (is (= "CDII" (roman-numerals/numerals 402))))

(deftest five-hundred-seventy-five
  (is (= "DLXXV" (roman-numerals/numerals 575))))

(deftest nine-hundred-eleven
  (is (= "CMXI" (roman-numerals/numerals 911))))

(deftest one-thousand-twenty-four
  (is (= "MXXIV" (roman-numerals/numerals 1024))))

(deftest three-thousand
  (is (= "MMM" (roman-numerals/numerals 3000))))

(deftest invalid-numbers
  (is (thrown? AssertionError (roman-numerals/numerals 0)))
  (is (thrown? AssertionError (roman-numerals/numerals -1)))
  (is (thrown? AssertionError (roman-numerals/numerals 3001))))

(deftest full-digits
  (is (= [0 0 0 0] (roman-numerals/full-digits 0)))
  (is (= [0 0 0 1] (roman-numerals/full-digits 1)))
  (is (= [0 0 1 0] (roman-numerals/full-digits 10)))
  (is (= [0 1 2 3] (roman-numerals/full-digits 123)))
  (is (= [8 3 6 7] (roman-numerals/full-digits 9818367))))

(deftest pad
  (is (= [1 2 3 0 0 0 0] (roman-numerals/pad 7 0 [1 2 3])))
  (is (= [1 2 3] (roman-numerals/pad 3 0 [1 2 3 5]))))

(def roman-digit-group-ones
  {:one \I
   :half \V
   :full \X})

(deftest roman-digit
  (are [expect digit] (= expect (roman-numerals/roman-digit roman-digit-group-ones digit))
    "I" 1
    "II" 2
    "III" 3
    "IV" 4
    "V" 5
    "VI" 6
    "VII" 7
    "VIII" 8
    "IX" 9))
