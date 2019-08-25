(ns hamming)

(defn hamming-score [l]
  (if (apply not= l)
    1
    0))

(defn distance [strand1 strand2]
  (loop [num-diffs 0
         strands (list strand1 strand2)]
    (cond
      (every? empty? strands) num-diffs
      (not-any? empty? strands) (recur (-> (map first strands)
                                           (hamming-score)
                                           (+ num-diffs))
                                       (map rest strands))
      :else nil)))
