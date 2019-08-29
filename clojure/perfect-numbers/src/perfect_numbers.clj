(ns perfect-numbers)

(defn divisible-by? [num div]
  (zero? (mod num div)))

(defn factors [number]
  (if (pos? number) 
    (let [max-candidate (quot number 2)
          candidates (range 1 (inc max-candidate))]
      (filter (partial divisible-by? number) candidates))
    (throw (IllegalArgumentException. "Can not classify negative numbers."))))

(defn classify [number]
  (let [aliquot-sum (apply + (factors number))]
    (condp apply [aliquot-sum number]
      > :abundant
      < :deficient
      = :perfect)))
