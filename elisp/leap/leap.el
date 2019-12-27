;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:
(defun divisible-by-p (d a)
  (zerop (% a d)))

(defun leap-year-p (year)
  "Check if a given year is a leap year."
  (or (divisible-by-p 400 year)
      (and (not (divisible-by-p 100 year))
	   (divisible-by-p 4 year))))

(provide 'leap)
;;; leap.el ends here
