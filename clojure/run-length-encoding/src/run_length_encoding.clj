(ns run-length-encoding)

(defn some-item [pred item]
  (when (pred item) item))

(defn compress-group [group]
  (str (some-item (partial < 1)
                  (count group))
       (first group)))

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
