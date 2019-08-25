(ns grade-school)

(defn grade [school grade]
  (get school grade []))

(defn add [school name grade]
  (update school grade (fnil conj []) name))

(defn map-kv [m f]
  (reduce-kv #(assoc %1 %2 (f %3)) {} m))

(defn sorted [school]
  (into (sorted-map) (map-kv school sort)))
