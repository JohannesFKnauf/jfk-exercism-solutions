(ns grains)

(defn squares []
  (let [double (partial *' 2)]
    (iterate double 1)))

(defn square [n]
  {:pre [(pos? n)]}
  (nth (squares) (dec n)))

(defn total []
  (->> (squares)
       (take 64)
       (reduce +)))
