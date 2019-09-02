(ns all-your-base)


(defn to-int [in-radix digits]
  (reduce (fn [result digit] (if (or (not (< digit in-radix))
                                     (< digit 0)) (reduced nil)
                                 (+ (* in-radix result)
                                    digit)))
          digits))

(defn reverse-base-digits [out-radix n]
  (lazy-seq (if (zero? n) '(0)
                (cons (mod n out-radix)
                      (reverse-base-digits out-radix (quot n out-radix))))))

(defn to-base [out-radix n]
  (->> n
       (reverse-base-digits out-radix)
       (reverse)
       (drop-while zero?)
       (#(if (empty? %) '(0) %))))
    

(defn convert [in-radix digits out-radix]
  (cond (not (> in-radix 1)) nil
        (not (> out-radix 1)) nil
        (empty? digits) '()
        :else (some->> digits
                       (to-int in-radix)
                       (to-base out-radix))))
