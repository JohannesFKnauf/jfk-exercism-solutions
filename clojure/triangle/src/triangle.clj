(ns triangle)

(defn type [a b c]
  (cond

    (or (<= (+ a b) c)
        (<= (+ b c) a)
        (<= (+ a c) b))
    :illogical

    (= a b c)
    :equilateral

    (or (= a b)
        (= b c)
        (= a c))
    :isosceles

    :else
    :scalene))
