(ns series)

(defn slices [string length]
  (if (zero? length)
    [""]
    (map clojure.string/join
         (partition length 1 string))))
