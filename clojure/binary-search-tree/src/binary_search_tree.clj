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
  (cond
    (nil? t) (singleton n)
    (<= n (value t)) (assoc t 1 (insert n (left t)))
    :else (assoc t 2 (insert n (right t)))))

(defn to-list [t]
  (if (nil? t)
    []
    (concat (to-list (left t))
            [(value t)]
            (to-list (right t)))))

(defn from-list [coll]
  (reduce #(insert %2 %1) nil coll))
