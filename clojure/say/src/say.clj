(ns say)

(def simple-number-words
  {0 "zero"
   1 "one"
   2 "two"
   3 "three"
   4 "four"
   5 "five"
   6 "six"
   7 "seven"
   8 "eight"
   9 "nine"
   10 "ten"
   11 "eleven"
   12 "twelve"
   13 "thirteen"
   14 "fourteen"
   15 "fifteen"
   16 "sixteen"
   17 "seventeen"
   18 "eighteen"
   19 "nineteen"})

(def number-words
  (into simple-number-words
        (for [[tens tens-word] [[20 "twenty"]
                                [30 "thirty"]
                                [40 "forty"]
                                [50 "fifty"]
                                [60 "sixty"]
                                [70 "seventy"]
                                [80 "eighty"]
                                [90 "ninety"]]
              [ones ones-word] (map #(vector % (simple-number-words %))
                                    (range 0 9))]
          {(+ tens ones) (if (zero? ones)
                           tens-word
                           (str tens-word "-" ones-word))})))

(def magnitudes
  [nil "thousand" "million" "billion"])

(defn chunks-of-thousand [n]
  (lazy-seq (when (pos? n)
              (cons (mod n 1000) (chunks-of-thousand (quot n 1000))))))


(defn chunk-words [num mag]
  {:pre [(< num 1000)]}
  (let [hundreds (quot num 100)
        minor (mod num 100)]
    (cond-> []
      (pos? hundreds) (conj (number-words hundreds) "hundred")
      (pos? minor) (conj (number-words minor))
      mag (conj mag))))

(defn say [n]
  (->> n
       (chunks-of-thousand)
       (map vector magnitudes)
       (remove (fn [[_ chunk]]
                 (zero? chunk)))
       (map (fn [[mag chunk]]
              (chunk-words chunk mag)))
       (reverse)
       (flatten)
       (clojure.string/join " ")))

(defn number [num]
  (cond
    (zero? num) "zero"
    (neg? num) (throw (IllegalArgumentException. "Negative numbers not allowed."))
    (>= num 1000000000000) (throw (IllegalArgumentException. "Too big number."))
    :valid (say num)))
