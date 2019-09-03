(ns pig-latin
  (:require clojure.string))

(def starts-with-vowel #"^((?:[aeiou]|xr|yt)\w*)()$")
(def starts-with-consonant #"^([bcdfghjklmnpqrstvwxz]*qu|[bcdfghjklmnpqrstvwxyz][bcdfghjklmnpqrstvwxz]*)(\w*)$")

(defn translate-word [s]
  (->> [starts-with-vowel starts-with-consonant]
       (some #(re-matches %1 s))
       (#(str (% 2) (% 1) "ay"))))

(defn translate [s]
  (->> (clojure.string/split s #" ")
       (map translate-word)
       (clojure.string/join " ")))
