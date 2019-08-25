(ns word-count)

(defn word-count [s]
  (->> s
       (re-seq #"\p{Alnum}+(?=[\p{Alnum}\p{Space}]*)")
       (map clojure.string/lower-case)
       (frequencies)))
