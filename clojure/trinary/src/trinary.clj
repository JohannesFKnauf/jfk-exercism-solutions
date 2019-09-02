(ns trinary)

(defn to-digit [c]
  (case c
    \0 0
    \1 1
    \2 2))

(def powers-of-three
  (iterate (partial * 3) 1))

(defn to-decimal [s]
  (try
    (->> s
         (reverse)
         (map to-digit)
         (map * powers-of-three)
         (reduce +))
    (catch IllegalArgumentException e 0)))
