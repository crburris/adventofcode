;; Advent of Code 2024 Day 2
;; Caelan Burris

(defun map-input-lines (function stream)
  (loop :for line = (read-line stream nil)
        :while line
        :collect (funcall function line)))

(defun parse-report (string)
  (do ((next-pos 0)
       (levels nil)
       (at-end nil))
      (at-end (nreverse levels))
    (multiple-value-bind (this-field field-end)
        (parse-integer string :start next-pos :junk-allowed t)
      (when this-field
        (push this-field levels)
        (setf next-pos field-end))
      (setf at-end (null this-field)))))

(defun read-reports (stream)
  (map-input-lines #'parse-report stream))

(defun level-changes (report)
  (mapcar #'- (cdr report) report))

(defun some-subreport-p (predicate report)
  (do ((head nil (cons (car tail) head))
       (tail report (cdr tail)))
      ((null tail) nil)
    (when (funcall predicate (append (reverse head) (cdr tail)))
      (return t))))

(defun safe-report-p (report &optional (margin 0))
  (if (zerop margin)
      (let* ((changes (level-changes report)))
        (and (every (lambda (change)
                      (and (>= change 1)
                           (<= change 3)))
                    (mapcar #'abs changes))
             (or (notany #'minusp changes)
                 (notany #'plusp changes))))
      (some-subreport-p (lambda (subreport)
                          (safe-report-p subreport (1- margin)))
                        report)))

(defun part-1 (input-path)
  (with-open-file (input input-path)
    (count-if #'safe-report-p (read-reports input))))

(defun part-2 (input-path)
  (with-open-file (input input-path)
    (count-if (lambda (report) (safe-report-p report 1))
              (read-reports input))))
