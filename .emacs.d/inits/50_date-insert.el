(defun insert-current-time()
  (interactive)
  (insert (format-time-string "%Y-%m-%d(%a) %H:%M:%S" (current-time))))

(define-key global-map "\C-cd" `insert-current-time)
