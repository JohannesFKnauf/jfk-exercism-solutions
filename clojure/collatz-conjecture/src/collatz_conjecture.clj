(ns collatz-conjecture)

(defn collatz-step [n]
  (if (even? n) (/ n 2)
      (+ 1 (* n 3))))

(defn collatz-seq [n]
  (if (= n 1) [1]
      (lazy-seq (cons n (collatz-seq (collatz-step n))))))

(defn collatz [num]
  (if (<= num 0) (throw (IllegalArgumentException. (str num " is not a  valid input for calculating the number of collatz steps.")))
    (dec (count (collatz-seq num)))))
