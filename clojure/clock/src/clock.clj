(ns clock)

(defn clock->hours [clock]
  (quot clock 60))

(defn clock->minutes [clock]
  (mod clock 60))

(defn clock->string [clock]
  (format "%02d:%02d"
          (clock->hours clock)
          (clock->minutes clock)))

(def minutes-per-day
  (* 24 60))

(defn hours->minutes [hours]
  (* 60 hours))

(defn clock [hours minutes]
  (-> hours
      (hours->minutes)
      (+ minutes)
      (mod minutes-per-day)))

(defn add-time [clock time]
  (-> clock
      (+ time)
      (mod minutes-per-day)))
