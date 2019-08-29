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

(defmacro def-on-planet [planet]
  `(do
     (defn ~(symbol (str "on-" planet)) [seconds] (str seconds))))

(def all-planets
  (map name (keys orbital-periods)))

(doseq
    [planet all-planets]
  (intern *ns*
          (symbol (str "on-" planet))
          (fn [seconds]
            (in-orbital-years seconds (keyword planet)))))
