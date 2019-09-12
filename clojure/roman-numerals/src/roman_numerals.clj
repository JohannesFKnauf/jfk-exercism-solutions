(ns roman-numerals)

(defn pad [n v coll]
  (take n (concat coll (repeat v))))

(defn reverse-base-digits [n]
  (lazy-seq (if (zero? n) '()
                (cons (mod n 10)
                      (reverse-base-digits (quot n 10))))))

(defn full-digits [n]
  (if (zero? n) '(0 0 0 0)
      (->> n
           reverse-base-digits
           (pad 4 0)
           reverse)))

(def roman-digit-groups
  [{:one \M
    :half nil
    :full nil}
   {:one \C
    :half \D
    :full \M}
   {:one \X
    :half \L
    :full \C}
   {:one \I
    :half \V
    :full \X}])

(defn roman-digit [roman-digit-group digit]
  (let [{:keys [one half full]} roman-digit-group]
    (clojure.string/join (case digit
                           0 []
                           1 [one]
                           2 [one one]
                           3 [one one one]
                           4 [one half]
                           5 [half]
                           6 [half one]
                           7 [half one one]
                           8 [half one one one]
                           9 [one full]))))

(defn numerals [n]
  {:pre [(< 0 n 3001)]}
  (->> n
       full-digits
       (map roman-digit roman-digit-groups)
       clojure.string/join))
