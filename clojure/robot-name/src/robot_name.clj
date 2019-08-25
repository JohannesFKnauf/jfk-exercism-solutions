(ns robot-name)

(def robots (atom #{}))

(def upper-case-letters (seq "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
(def digits (seq "0123456789"))

(defn random-chars [n charset]
  (take n (repeatedly #(rand-nth charset))))

(defn random-robot-name-candidate []
  (apply str (concat (random-chars 2 upper-case-letters)
                     (random-chars 3 digits))))

(defn robot []
  (let [random-robot (->> random-robot-name-candidate
                          (repeatedly)
                          (filter #(not (contains? @robots %)))
                          (first)
                          (atom))]
    (do (swap! robots conj random-robot)
        random-robot)))

(defn robot-name [robot]
  @robot)

(defn reset-name [robot] 
  (reset! robot (random-robot-name-candidate)))
