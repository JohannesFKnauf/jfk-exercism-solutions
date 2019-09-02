(ns atbash-cipher)

(defn char-range [start end]
  (map char (range (int start)
                   (inc (int end)))))

(def cipher-mapping
  (merge (zipmap (char-range \a \z)
                 (reverse (char-range \a \z)))
         (zipmap (char-range \0 \9)
                 (char-range \0 \9))))

(defn encode [s]
  (->> s
       (clojure.string/lower-case)
       (filter #(contains? cipher-mapping %))
       (map cipher-mapping)
       (partition 5 5 nil)
       (map (partial apply str))
       (clojure.string/join " ")))
