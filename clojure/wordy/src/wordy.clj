(ns wordy
  (:require [clojure.string]
            [instaparse.core :as insta]))

(def wordy-parser
  (insta/parser
   "expression = <intro> <whitespace+> initial ( <whitespace> operation )* <question-mark>
    intro = 'What is'
    question-mark = '?'
    initial = number
    operation = operator <whitespace+> operand
    operator = minus | plus | divided | multiplied
    operand = number
    minus = 'minus'
    plus = 'plus'
    divided = 'divided by'
    multiplied = 'multiplied by'
    number = #'-?[0-9]+'
    whitespace = #'\\s'"))

(defn ast->value [ast]
  (insta/transform {:plus (fn [x] +)
                    :minus (fn [x] -)
                    :divided (fn [x] /)
                    :multiplied (fn [x] *)
                    :operator identity
                    :number #(Integer/parseInt %)
                    :operand identity
                    :operation #(fn [x] (%1 x %2))
                    :initial #(partial + %)
                    :expression #(reduce (fn [acc f] (f acc)) 0 %&)}
                   ast))

(defn evaluate [expr]
  (let [parse-result (wordy-parser expr)]
    (if (insta/failure? parse-result)
      (throw (IllegalArgumentException. "Failed parsing malformed expression"))
      (ast->value parse-result))))

