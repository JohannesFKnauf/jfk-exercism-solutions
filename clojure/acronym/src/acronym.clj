(ns acronym)

(defn word-initials [s]
  (re-seq #"^\p{Upper}|(?<=[-\s])\p{Alpha}|(?<=\p{Lower})\p{Upper}" s))

(defn acronym [s]
  (->> s
       word-start-letters
       clojure.string/join
       clojure.string/upper-case))
