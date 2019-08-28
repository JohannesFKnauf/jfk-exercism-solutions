(ns say)

(def ones
  {0 "zero"
   1 "one"
   2 "two"
   3 "three"
   4 "four"
   5 "five"
   6 "six"
   7 "seven"
   8 "eight"
   9 "nine"})

(def teens
  {10 "ten"
   11 "eleven"
   12 "twelve"
   13 "thirteen"
   14 "fourteen"
   15 "fifteen"
   16 "sixteen"
   17 "seventeen"
   18 "eighteen"
   19 "nineteen"})

(def tens
  {2 "twenty"
   3 "thirty"
   4 "forty"
   5 "fifty"
   6 "sixty"
   7 "seventy"
   8 "eighty"
   9 "ninety"})

(declare number)

(defn non-zero-number [n]
  (when (not (zero? n))
    (number n)))    

(defn say-with-scale [num scale word]
  (let [[q m] ((juxt quot mod) num scale)
        numparts [(number q)
                  word
                  (non-zero-number m)]
        nonnilparts (keep identity numparts)]
    (clojure.string/join " " nonnilparts)))

(defn number [num]
  (condp > num
    0 (throw (IllegalArgumentException. "No negative numbers."))
    10 (get ones num)
    20 (get teens num)
    100 (let [[q m] ((juxt quot mod) num 10)]
          (str (get tens q) (when-let [n (non-zero-number m)]
                              (str "-" n))))
    1000 (say-with-scale num 100 "hundred")
    1000000 (say-with-scale num 1000 "thousand")
    1000000000 (say-with-scale num 1000000 "million")
    1000000000000 (say-with-scale num 1000000000 "billion")
    (throw (IllegalArgumentException. "Too big number."))))
