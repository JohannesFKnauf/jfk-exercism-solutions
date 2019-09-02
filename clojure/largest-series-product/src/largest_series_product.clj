(ns largest-series-product)

(defn largest-product [n s]
  {:pre [(>= n 0)
         (every? #(Character/isDigit %) s)
         (>= (count s) n)]}
  (->> s
       (partition n 1)
       (map (fn [coll]
              (map #(Integer/parseInt (str %)) coll)))
       (map #(reduce * 1 %))
       (#(if (empty? %) 1 (reduce max %)))))
