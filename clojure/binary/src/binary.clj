(ns binary)

(def powers-of-2
  (iterate #(* 2 %) 1))

(defn to-decimal [radix-2-num]
  (let [parsed-bits (map {\1 1 \0 0} radix-2-num)]
    (if (some nil? parsed-bits)
      0
      (->> parsed-bits
           (reverse)
           (map * powers-of-2)
           (reduce +)))))
