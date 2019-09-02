(ns pascals-triangle)

(defn next-row [current-row]
  (mapv +'
        (concat [0] current-row)
        (concat current-row [0])))

(def triangle
  (iterate next-row [1]))

(defn row [n]
  (nth triangle (dec n)))
