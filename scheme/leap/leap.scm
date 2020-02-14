(import (rnrs))

(define (divisible-by? d a)
  (zero? (remainder a d)))

(define (leap-year? year)
  (or (divisible-by? 400 year)
      (and (not (divisible-by? 100 year))
	   (divisible-by? 4 year))))

