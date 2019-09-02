(ns isogram
  (:require [clojure.string]))


(defn isogram? [s]
  (->> s
       (filter #(Character/isLetter %))
       (map #(Character/toLowerCase %))
       (frequencies)
       (vals)
       (filter #(not= 1 %))
       (empty?)))
