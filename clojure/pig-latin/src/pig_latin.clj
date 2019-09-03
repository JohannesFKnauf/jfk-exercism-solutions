(ns pig-latin
  (:use [clojure.string :only [replace split join]]))


(def starts-with-vowel #"^([aeiou]|xr|yt)\w*")

(def starts-with-consonant #"^([bcdfghjklmnpqrstvwxyz]+)(\w*)")

(def starts-with-consonant-and-qu #"^([bcdfghjklmnpqrstvwxz]*qu)(\w*)")

(def starts-with-consonant-and-y #"^([bcdfghjklmnpqrstvwxz]+y)(\w*)")



(defn translate-word [s]
  (condp re-matches s
    starts-with-vowel (str s "ay")
    starts-with-consonant-and-qu (replace s starts-with-consonant-and-qu "$2$1ay")
    starts-with-consonant-and-y (replace s starts-with-consonant-and-y "$2$1ay")
    starts-with-consonant (replace s starts-with-consonant "$2$1ay")
    s))

(defn translate [s]
  (join " "
        (map translate-word
             (split s #" "))))
