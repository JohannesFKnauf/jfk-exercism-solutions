(ns accumulate)

(defn accumulate [f coll]
  (lazy-seq
   (when-let [s (seq coll)]
     (cons
      (f (first coll))
      (accumulate f (rest coll))))))
