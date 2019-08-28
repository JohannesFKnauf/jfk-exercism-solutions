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

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> cipher-text
       (re-seq #"\d*\D|\D")
       (map (partial re-seq #"\d+|\D"))
       (map (partial apply
                     (fn
                       ([digits character] (repeat (Integer/parseInt digits) character))
                       ([character] (list character)))))
       (flatten)
       (apply str)))
