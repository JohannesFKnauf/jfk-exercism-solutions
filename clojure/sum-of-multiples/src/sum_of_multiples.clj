(ns sum-of-multiples)

(defn sum-of-multiples [ns limit]
  (->> ns
       (mapcat #(range % limit %))
       (into #{})
       (reduce +)))
