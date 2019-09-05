(ns acronym
  (:require [clojure.string :as string]))

(defn words [s]
  (string/split s #"\s|-|(?<=\p{Lower})(?=\p{Upper})"))

(defn acronym [s]
  (->> s
       words
       (map first)
       string/join
       string/upper-case))
