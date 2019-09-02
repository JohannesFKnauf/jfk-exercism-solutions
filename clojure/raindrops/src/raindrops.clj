(ns raindrops)

(def drops
  {3 "Pling"
   5 "Plang"
   7 "Plong"})

(defn divisible-by? [n]
  #(= 0 (mod % n)))

(defn dropify [n]
  (reduce-kv #(if ((divisible-by? %2) n)
                (str %1 %3)
                %1)
             ""
             drops))



(defn convert [n]
  (let [c (dropify n)]
    (if (clojure.string/blank? c)
      (str n)
      c)))
