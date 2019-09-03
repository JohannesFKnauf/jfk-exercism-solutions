(ns pig-latin
  (:require clojure.string))

(def vowel-rule #"^((?:[aeiou]|xr|yt)\w*)()$")
(def consonant-rule #"^([bcdfghjklmnpqrstvwxz]*qu|[bcdfghjklmnpqrstvwxyz][bcdfghjklmnpqrstvwxz]*)(\w*)$")

(defn translate-word [s]
  (->> [vowel-rule consonant-rule]
       (some #(re-matches %1 s))
       (#(str (% 2) (% 1) "ay"))))

(defn translate [s]
  (->> (clojure.string/split s #" ")
       (map translate-word)
       (clojure.string/join " ")))
