(ns binary)

(defn to-decimal [radix-2-num]
  (->> radix-2-num
       (map #(= \1 %))
       (reverse)
       (map list
            (iterate (partial * 2) 1))
       (filter second)
       (map first)
       (reduce +)))
