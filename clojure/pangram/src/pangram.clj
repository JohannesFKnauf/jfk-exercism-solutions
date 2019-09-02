(ns pangram)

(def alphabet
  (map char
       (range (int \a)
              (inc (int \z)))))

(defn pangram? [s]
  (->> s
       (clojure.string/lower-case)
       (filter #(Character/isLowerCase %))
       (into (sorted-set))
       (into (vector))
       (= alphabet)))
