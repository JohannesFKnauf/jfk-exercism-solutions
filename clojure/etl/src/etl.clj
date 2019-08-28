(ns etl)

(defn key-list-to-flat-map [key list]
  (reduce #(assoc %1 (clojure.string/lower-case %2) key) {} list))

(defn key-list-into-map [result key list]
  (merge result (key-list-to-flat-map key list)))

(defn transform [source]
  (reduce-kv key-list-into-map {} source))
