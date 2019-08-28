(ns etl)

(defn key-list-to-flat-map [key list]
  (reduce #(assoc %1 (clojure.string/lower-case %2) key) {} list))

(defn transform [source]
  (reduce-kv #(merge %1 (key-list-to-flat-map %2 %3)) {} source))
