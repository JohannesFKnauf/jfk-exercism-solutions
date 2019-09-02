(ns octal)


(defn to-digit [c]
  (case c
    \0 0
    \1 1
    \2 2
    \3 3
    \4 4
    \5 5
    \6 6
    \7 7))

(defn to-decimal [s]
  (try
    (->> s
         (map to-digit)
         (reduce #(+ (* 8 %1) %2)))
    (catch IllegalArgumentException e 0)))
