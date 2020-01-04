(ns minesweeper
  (:require [clojure.string]))

(defn shift-left [board]
  (map #(concat (rest %) [0]) board))

(defn shift-right [board]
  (map #(concat [0] (drop-last %)) board))

(defn shift-up [board]
  (concat (rest board) [(vec (repeat (count (first board)) 0))]))

(defn shift-down [board]
  (concat [(vec (repeat (count (first board)) 0))] (drop-last board)))

(defn add-boards [b1 b2]
  (map #(map + %1 %2) b1 b2))

(defn parse-field [field]
  (case field
    \space 0
    \* 1))

(defn draw-field [field value]
  (if (= 1 field)
    "*"
    (if (= 0 value)
      \space
      (str value))))

(defn draw-board-with-values [board values]
  (->> (map #(map draw-field %1 %2) board values)
       (map (partial apply str))
       (clojure.string/join "\n")))
  
(defn draw [raw-board]
  (let [board (->> raw-board
                   clojure.string/split-lines
                   (map #(map parse-field %)))
        values (reduce add-boards ((juxt shift-left
                                         (comp shift-left shift-up)
                                         shift-up
                                         (comp shift-up shift-right)
                                         shift-right
                                         (comp shift-right shift-down)
                                         shift-down
                                         (comp shift-down shift-left)) board))]
    (draw-board-with-values board values)))

