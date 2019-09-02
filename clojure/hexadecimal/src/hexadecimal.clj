(ns hexadecimal)

(def powers-of-16
  (iterate #(* 16 %) 1))

(def digits
  {\0 0
   \1 1
   \2 2
   \3 3
   \4 4
   \5 5
   \6 6
   \7 7
   \8 8
   \9 9
   \a 10
   \b 11
   \c 12
   \d 13
   \e 14
   \f 15})

(defn hex-to-int [radix-16-num]
  (let [parsed-bits (map digits radix-16-num)]
    (if (some nil? parsed-bits)
      0
      (->> parsed-bits
           (reverse)
           (map * powers-of-16)
           (reduce +)))))
