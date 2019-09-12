(ns roman-numerals)

(defn pad [n v coll]
  (take n (concat coll (repeat v))))

(defn reverse-base10-digits
  "reverse-base10-digits splits a number into its base 10 digits, starting with the lowest digit."
  [n]
  (lazy-seq (if (zero? n) '()
                (cons (mod n 10)
                      (reverse-base10-digits (quot n 10))))))

(defn full-digits
  "full-digits returns all 4 relevant digits for roman numerals, starting with the highest digit, i.e. the thousands. Missing values are padded by 0."
  [n]
  (if (zero? n) '(0 0 0 0)
      (->> n
           reverse-base10-digits
           (pad 4 0)
           reverse)))

(def roman-digit-groups
  [[\M nil nil]
   [\C \D \M]
   [\X \L \C]
   [\I \V \X]])

(defn roman-digit [[one five ten] digit]
  (clojure.string/join (case digit
                         0 []
                         1 [one]
                         2 [one one]
                         3 [one one one]
                         4 [one five]
                         5 [five]
                         6 [five one]
                         7 [five one one]
                         8 [five one one one]
                         9 [one ten])))

(defn numerals [n]
  {:pre [(< 0 n 3001)]}
  (->> n
       full-digits
       (map roman-digit roman-digit-groups)
       clojure.string/join))
