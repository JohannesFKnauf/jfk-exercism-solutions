(ns anagram)

(def canonicalize-case
  clojure.string/lower-case)

(defn same-letters? [& words]
  (->> words
       (map canonicalize-case)
       (map frequencies)
       (apply =)))

(defn different-word? [& words]
  (->> words
       (map canonicalize-case)
       (apply not=)))

(defn every-word-pred [word & fns]
  (apply every-pred (map #(partial % word) fns)))

(defn anagrams-for [word prospect-list]
  (->> prospect-list
       (filter (every-word-pred word
                                same-letters?
                                different-word?))))
