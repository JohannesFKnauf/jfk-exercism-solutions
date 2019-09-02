(ns strain)

(defn conj-if [pred coll elem]
  (if (pred elem)
    (conj coll elem)
    coll))

(defn retain [pred coll]
  (reduce (partial conj-if pred) [] coll))

(defn discard [pred coll]
  (reduce (partial conj-if (complement pred)) [] coll))
