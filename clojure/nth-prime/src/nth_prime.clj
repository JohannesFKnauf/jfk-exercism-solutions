(ns nth-prime)

(defn is-prime [n]
  (let [max-test (-> n Math/sqrt Math/floor)]
    (not-any? zero? (for [x (range 2 (inc max-test))]
                      (rem n x)))))

(def primes
  (filter is-prime (drop 2 (range))))

(defn nth-prime [n]
  (if (< n 1)
    (throw (IllegalArgumentException. (str "There is no " n "-th prime.")))
    (nth primes (dec n))))
