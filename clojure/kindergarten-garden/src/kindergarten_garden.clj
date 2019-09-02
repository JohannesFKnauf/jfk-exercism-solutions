(ns kindergarten-garden)

(defn resolve-plant [plant-initial]
  ({\V :violets
    \C :clover
    \G :grass
    \R :radishes} plant-initial))

(def default-kids
  ["Alice" "Bob" "Charlie" "David" "Eve" "Fred" "Ginny" "Harriet" "Ileana" "Joseph" "Kincaid" "Larry"])


(defn garden
  ([s] (garden s default-kids))
  ([s names] (let [name->keyword (comp keyword clojure.string/lower-case)
                   name-keys (map name->keyword names)
                   sorted-name-keys (sort name-keys)]
               (->> s
                    (#(clojure.string/split % #"\n"))
                    (map (partial partition 2))
                    (apply (partial map concat))
                    (map (partial map resolve-plant))
                    (map (partial into []))
                    (interleave sorted-name-keys)
                    (apply (partial assoc {}))))))
