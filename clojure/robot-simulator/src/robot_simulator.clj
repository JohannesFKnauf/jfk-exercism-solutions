(ns robot-simulator)

(defn robot [coordinates bearing]
  {:coordinates coordinates,
   :bearing bearing})

(def bearings [:north :east :south :west])

(defn rotate [v]
  (take 4 (drop 1 (cycle bearings))))

(def bearings-right
  (zipmap bearings
          (rotate bearings)))

(defn turn-right [bearing]
  (bearings-right bearing))

(def bearings-left
  (zipmap (rotate bearings)
          bearings))

(defn turn-left [bearing]
  (bearings-left bearing))

(def advancements
  {:north {:x 0, :y 1},
   :east {:x 1, :y 0},
   :south {:x 0, :y -1},
   :west {:x -1, :y 0}})

(defn advance [coordinates bearing]
  (merge-with + coordinates (advancements bearing)))

(defn perform-action [robot action]
  (case action
    \L (update robot :bearing turn-left)
    \R (update robot :bearing turn-right)
    \A (update robot :coordinates advance (robot :bearing))))

(defn simulate [actions robot]
  (reduce perform-action robot actions))
