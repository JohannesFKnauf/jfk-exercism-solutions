(ns leap)

(defn- divisible-by? [num divisor]
  (= 0 (mod num divisor)))

(defn leap-year? [year]
  (or (divisible-by? year 400)
      (and (divisible-by? year 4)
           (not (divisible-by? year 100)))))
