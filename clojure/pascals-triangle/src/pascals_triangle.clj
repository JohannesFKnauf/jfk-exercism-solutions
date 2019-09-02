(ns pascals-triangle)

(defn rows
  ([] (rows [1]))
  ([current-row] (let [next-row (mapv +'
                                      (concat [0] current-row)
                                      (concat current-row [0]))]
                   (lazy-seq (cons current-row
                                   (rows next-row))))))

(def triangle
  (rows))

(defn row [n]
  (nth triangle (dec n)))
