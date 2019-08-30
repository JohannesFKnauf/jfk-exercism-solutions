(ns gigasecond)

(def giga 1000000000)

(defn from [year month day]
  (-> (java.time.LocalDate/of year month day)
      (.atStartOfDay)
      (.toInstant java.time.ZoneOffset/UTC)
      (.plusSeconds giga)
      (.atOffset java.time.ZoneOffset/UTC)
      (bean)
      ((juxt :year :monthValue :dayOfMonth))))
