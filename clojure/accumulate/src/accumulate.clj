(ns accumulate)

(defn accumulate [f coll]
  (for [x coll]
    (f x)))
