(ns run-length-encoding)

(defn compress-group [group]
  (let [len (count group)
        char (first group)]
    (str (if (< 1 len)
           len
           nil)
         char)))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> plain-text
       (partition-by identity)
       (map compress-group)
       (apply str)))

(defn digits->integer [digits]
  (if (nil? digits)
    1
    (Integer/parseInt digits)))

(defn expand-group [[full-match count-match character-match]]
  (let [count (digits->integer count-match)
        characters (repeat count character-match)]
    (apply str characters)))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> cipher-text
       (re-seq #"(\d+)?(\D)")
       (map expand-group)
       (apply str)))
