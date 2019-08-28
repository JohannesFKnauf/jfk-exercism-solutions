(ns run-length-encoding)

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> plain-text
       (partition-by identity)
       (map (juxt count first))
       (flatten)
       (filter (partial not= 1))
       (apply str)))

(defn digits->integer [digits]
  (if (nil? digits)
    1
    (Integer/parseInt digits)))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> cipher-text
       (re-seq #"(\d+)?(\D)")
       (map rest)
       (map (fn [[digits character]]
              (repeat (digits->integer digits)
                      character)))
       (flatten)
       (apply str)))
