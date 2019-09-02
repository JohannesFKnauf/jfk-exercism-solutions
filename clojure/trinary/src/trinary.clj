(ns trinary)

(defn to-digit [c]
  (case c
    \0 0
    \1 1
    \2 2))

(defn to-decimal [s]
  (try
    (->> s
         (map to-digit)
         (reduce #(+ (* 3 %1) %2)))
    (catch IllegalArgumentException e 0)))
