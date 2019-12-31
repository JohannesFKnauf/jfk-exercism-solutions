(ns wordy
  (:require [instaparse.core :as insta]))

(def wordy-parser
  (insta/parser
   "expression = <'What is'> <' '> initial ( <' '> operation )* <'?'>
    initial = number
    operation = operator <' '> operand
    <operator> = minus | plus | divided | multiplied
    <operand> = number
    minus = <'minus'>
    plus = <'plus'>
    divided = <'divided by'>
    multiplied = <'multiplied by'>
    number = #'-?[0-9]+'"))

(defn ast->value [ast]
  (insta/transform {:plus (fn [] +)
                    :minus (fn [] -)
                    :divided (fn [] /)
                    :multiplied (fn [] *)
                    :number #(Integer/parseInt %)
                    :operation #(fn [x] (%1 x %2))
                    :initial #(partial + %)
                    :expression #(reduce (fn [acc f] (f acc)) 0 %&)}
                   ast))

(defn evaluate [expr]
  (let [parse-result (wordy-parser expr)]
    (if (insta/failure? parse-result)
      (throw (IllegalArgumentException. "Failed parsing malformed expression"))
      (ast->value parse-result))))

