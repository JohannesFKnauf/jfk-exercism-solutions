(ns largest-series-product)

(defn largest-product [n s]
  {:pre [(>= n 0)
         (every? #(Character/isDigit %) s)
         (>= (count s) n)]}
  (let [products (->> s
                      (map str)
                      (map #(Integer/parseInt %))
                      (partition n 1)
                      (map (partial reduce *)))]
    (if (seq products)
      (apply max products)
      1)))
