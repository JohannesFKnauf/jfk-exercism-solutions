(ns flatten-array)

(defn flatten [arr]
  (let [head (first arr)
        tail (rest arr)]
    (cond
      (nil? head) []
      (vector? head) (concat (flatten head) (flatten tail))
      :else (cons head (flatten tail)))))
