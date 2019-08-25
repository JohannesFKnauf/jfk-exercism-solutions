(ns word-count)

(defn word-count [s]
  (->> s
       (re-seq #"\p{Alnum}+(?=[\p{Alnum}\p{Space}]*)")
       (map clojure.string/lower-case)
       (reduce #(update %1 %2 (fnil inc 0)) {})))
