;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:

(require 'subr-x)

(defun silence-p (s)
  (equal "" s))

(defun question-p (s)
  (string-suffix-p "?" s))

(defun shouted-p (s)
  (and (string-match-p "[[:alpha:]]" s)
       (equal (upcase s) s)))

(defun response-for (statement)
  (let ((s (string-trim statement)))
    (cond ((silence-p s) "Fine. Be that way!")
          ((and (question-p s)
                (shouted-p s)) "Calm down, I know what I'm doing!")
          ((question-p s) "Sure.")
          ((shouted-p s) "Whoa, chill out!")
          (t "Whatever."))))

(provide 'bob)
;;; bob.el ends here
