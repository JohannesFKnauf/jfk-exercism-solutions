(ns all-your-base)

(defn illegal-digit? [digit in-radix]
  (or (not (< digit in-radix))
      (< digit 0)))

(defn shift-and-add-for-radix [in-radix]
  (fn [result digit]
    (+ digit
       (* in-radix result))))

(defn safe-shift-and-add-for-radix [in-radix]
  (fn [result digit]
    (if (illegal-digit? digit in-radix) (reduced nil)
        ((shift-and-add-for-radix in-radix) result digit))))

(defn to-int [in-radix digits]
  (reduce (safe-shift-and-add-for-radix in-radix) digits))


(defn reverse-base-digits [out-radix n]
  (lazy-seq (if (zero? n) '()
                (cons (mod n out-radix)
                      (reverse-base-digits out-radix (quot n out-radix))))))

(defn from-int [out-radix n]
  (if (zero? n) '(0)
      (->> n
           (reverse-base-digits out-radix)
           (reverse))))


(defn convert [in-radix digits out-radix]
  (cond (not (> in-radix 1)) nil
        (not (> out-radix 1)) nil
        (empty? digits) '()
        :else (some->> digits
                       (to-int in-radix)
                       (from-int out-radix))))
