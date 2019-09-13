(ns prime-factors)

(defn divisible-by? [n d]
  (zero? (rem n d)))

(defn max-true-prime-factor [n]
  (Math/floor (Math/sqrt n)))

(defn prime-factor-candidates
  ([n]
   (prime-factor-candidates n 2))
  ([n start]
   (range start (inc (max-true-prime-factor n)))))

(defn of
  ([n]
   (of n (prime-factor-candidates n)))
  ([n candidates]
   (cond
     (= 1 n) (list)
     (nil? candidates) (list n)
     (empty? candidates) (list n)
     (divisible-by? n (first candidates)) (let [d (first candidates)
                                                r (quot n d)]
                                            (lazy-seq (cons d
                                                            (of r
                                                                (prime-factor-candidates r d)))))
     :else (lazy-seq (of n (next candidates))))))

