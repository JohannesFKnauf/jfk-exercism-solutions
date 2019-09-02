(ns raindrops)

(def alldrops
  {3 "Pling"
   5 "Plang"
   7 "Plong"})

(defn divisible-by? [n]
  #(zero? (mod % n)))

(defn divisible-by?-reducer [n]
  (fn [acc divisor dropstr]
    (if ((divisible-by? divisor) n) (str acc dropstr) acc)))

(defn dropify [n]
  (reduce-kv (divisible-by?-reducer n) nil alldrops))

(defn convert [n]
  (if-let [raindrops (dropify n)]
    raindrops
    (str n)))
