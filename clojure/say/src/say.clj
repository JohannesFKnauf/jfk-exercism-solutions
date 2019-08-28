(ns say)

(def simple
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

(def all-static
  (into simple
        (for [[tens tensword] [[20 "twenty"]
                    [30 "thirty"]
                    [40 "forty"]
                    [50 "fifty"]
                    [60 "sixty"]
                    [70 "seventy"]
                    [80 "eighty"]
                    [90 "ninety"]]
              [ones onesword] (map #(vector % (get simple %)) (range 0 9))]
          {(+ tens ones) (if (zero? ones)
                           tensword
                           (str tensword "-" onesword))})))

(def magnitudes
  [nil "thousand" "million" "billion"])

(defn chunks-of-thousand [n]
  (lazy-seq (when (pos? n)
              (cons (mod n 1000) (chunks-of-thousand (quot n 1000))))))


(defn say-small-num [num]
  {:pre [(< num 1000)]}
  (let [[hundreds minor] ((juxt quot mod) num 100)]
    (if (zero? hundreds)
      (get all-static minor)
      (str (get all-static hundreds) " " "hundred" (if (zero? minor)
                                                     ""
                                                     (str " " (get all-static minor)))))))

(defn say [n]
  (->> n
       (chunks-of-thousand)
       (map vector magnitudes)
       (remove (fn [[mag chunk]]
                 (zero? chunk)))
       (map (fn [[mag chunk]]
              (let [said (say-small-num chunk)]
                (if mag
                  (str said " " mag)
                  (str said)))))
       (reverse)
       (clojure.string/join " ")))

(defn number [num]
  (cond
    (zero? num) "zero"
    (neg? num) (throw (IllegalArgumentException. "Negative numbers not allowed."))
    (>= num 1000000000000) (throw (IllegalArgumentException. "Too big number."))
    :valid (say num)))
