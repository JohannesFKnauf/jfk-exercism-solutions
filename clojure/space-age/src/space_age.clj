(ns space-age)

(defn map-kv [f coll]
  (reduce-kv (fn [m k v] (assoc m k (f v))) (empty coll) coll))

(def orbital-periods
  (map-kv #(* 31557600 %)
          {:earth 1
           :mercury 0.2408467
           :venus 0.61519726
           :mars 1.8808158
           :jupiter 11.862615
           :saturn 29.447498
           :uranus 84.016846
           :neptune 164.79132}))

(defn in-orbital-years [seconds planet]
  (float (/ seconds (get orbital-periods planet))))


(defn on-mercury [seconds]
  (in-orbital-years seconds :mercury))

(defn on-venus [seconds]
  (in-orbital-years seconds :venus))

(defn on-earth [seconds]
  (in-orbital-years seconds :earth))

(defn on-mars [seconds]
  (in-orbital-years seconds :mars))

(defn on-jupiter [seconds]
  (in-orbital-years seconds :jupiter))

(defn on-saturn [seconds]
  (in-orbital-years seconds :saturn))

(defn on-neptune [seconds]
  (in-orbital-years seconds :neptune))

(defn on-uranus [seconds]
  (in-orbital-years seconds :uranus))
