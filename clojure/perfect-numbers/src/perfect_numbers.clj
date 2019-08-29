(ns perfect-numbers)

(defn divisible-by? [num div]
  (zero? (mod num div)))

(defn factors [number]
  (let [max-candidate (quot number 2)
        candidates (range 1 (inc max-candidate))]
    (filter (partial divisible-by? number) candidates)))

(defn classify [number]
  (let [aliquot-sum (apply + (factors number))]
    (cond (< number 0) (throw (IllegalArgumentException. "Can not classify negative numbers."))
          (= number aliquot-sum) :perfect
          (< number aliquot-sum) :abundant
          (> number aliquot-sum) :deficient)))
