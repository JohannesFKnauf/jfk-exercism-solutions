(ns etl)

(defn transform [source]
  (into {}
        (for [[score letters] source
              letter letters]
          [(clojure.string/lower-case letter) score])))
