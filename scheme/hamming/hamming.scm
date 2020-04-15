(import (rnrs))

(define (hamming-distance strand-a strand-b)
  (unless (= (string-length strand-a)
             (string-length strand-b))
    (raise "strands have different length"))
  (fold-left (lambda (cur a b)
               (+ cur
                  (if (char=? a b) 0 1)))
             0
             (string->list strand-a)
             (string->list strand-b)))
