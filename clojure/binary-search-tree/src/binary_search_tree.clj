(ns binary-search-tree)

(defn singleton [n] 
  [n nil nil])

(defn value [t]
  (get t 0))

(defn left [t]
  (get t 1))

(defn right [t]
  (get t 2))

(defn insert [n t]
  (let [x (value t)
        l (left t)
        r (right t)]
    (cond
      (nil? t) (singleton n)
      (<= n x) [x (insert n l) r]
      :else [x l (insert n r)])))

(defn to-list [t]
  (if (nil? t)
    []
    (let [x (value t)
          l (left t)
          r (right t)]
      (concat (to-list l) [x] (to-list r)))))

(defn from-list [coll]
  (reduce #(insert %2 %1) nil coll))
