(ns prime-factors)

(defn divisible-by? [n d]
  (zero? (rem n d)))

(defn max-true-prime-factor [n]
  (Math/floor (Math/sqrt n)))

(defn of
  ([n]
   (of n 2 (max-true-prime-factor n)))
  ([n candidate max-prime]
   (cond
     (= 1 n) (list)
     (< max-prime candidate) (list n)
     (divisible-by? n candidate) (let [r (quot n candidate)]
                                   (lazy-seq (cons candidate
                                                   (of r candidate (max-true-prime-factor r)))))
     :else (lazy-seq
            (of n (inc candidate) max-prime)))))

