(ns luhn)

(defn digit->int [c]
  (case c
    \0 0
    \1 1
    \2 2
    \3 3
    \4 4
    \5 5
    \6 6
    \7 7
    \8 8
    \9 9))

(defn wrapped-double [i]
  (let [double (* i 2)]
    (if (< double 10)
      double
      (- double 9))))

(defn divisibly-by-10 [i]
  (-> i
      (mod 10)
      (= 0)))

(defn valid? [s]
  (and (not (re-find #"[^\p{Digit}\p{Space}]" s))
       (not (re-matches #"^\p{Space}*0$" s))
       (->> s
            (filter #(Character/isDigit %))
            (map digit->int)
            (reverse)
            (partition 2 2 (repeat 0))
            (map (fn [[a b]] (+ a (wrapped-double b))))
            (reduce +)
            (divisibly-by-10))))
