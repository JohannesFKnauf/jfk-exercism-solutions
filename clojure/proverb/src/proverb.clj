(ns proverb)

(defn verse [want loss]
  (str "For want of a " want " the " loss " was lost."))

(defn closing [want]
  (str "And all for the want of a " want "."))

(defn recite [wants]
  (clojure.string/join "\n" (when-let [first-want (first wants)]
                              (concat
                               (for [[want loss] (partition 2 1 wants)]
                                 (verse want loss))
                               [(closing first-want)]))))
(def proverb
  (recite ["nail"
           "shoe"
           "horse"
           "rider"
           "message"
           "battle"
           "kingdom"]))
