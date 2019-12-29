(ns meetup
  (:require [java-time :as jt]))

(defn first-in-month [month year weekday]
  (-> (jt/local-date year month 1)
      (jt/adjust :first-in-month weekday)))

(defn weekday-candidates [month year weekday]
  (->> (first-in-month month year weekday)
       (iterate #(jt/plus % (jt/weeks 1)))
       (take-while #(= (jt/as % :month-of-year) month))))

(defn week-selector [week]
  (case week
    :first #(nth % 0)
    :second #(nth % 1)
    :third #(nth % 2)
    :fourth #(nth % 3)
    :teenth (fn [coll]
              (first (filter #(< 12 (jt/as % :day-of-month) 20) coll)))
    :last last
    :else (throw (RuntimeException. "Unsupported week selector"))))

(defn meetup [month year weekday week]
  (let [wc (weekday-candidates month year weekday)
        ws (week-selector week)
        date (ws wc)]
    (jt/as date :year :month-of-year :day-of-month)))
