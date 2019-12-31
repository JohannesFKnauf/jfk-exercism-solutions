(ns matching-brackets
  (:require [clojure.set]))

(def opening-brackets
  #{\( \[ \{})

(def closing-brackets
  #{\) \] \}})

(def all-brackets
  (clojure.set/union opening-brackets closing-brackets))

(defn opening-bracket [bracket]
  (case bracket
    \) \(
    \] \[
    \} \{))

(defn update-bracket-stack [stack bracket]
  (if (opening-brackets bracket)
    (conj stack bracket)
    (if (= (peek stack) (opening-bracket bracket))
      (pop stack)
      (reduced '(\☠)))))

(defn valid? [s]
  (->> s
       (filter all-brackets)
       (reduce update-bracket-stack '())
       empty?))
