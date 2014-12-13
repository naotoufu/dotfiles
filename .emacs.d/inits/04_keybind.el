;; @ key bind

;; backslash
;(define-key global-map (kbd "m-|") "\\")

;; global C-z disable
(global-unset-key "\C-z")

; enable-BackSpace
(global-set-key "\C-h" 'delete-backward-char)

;; enable-BackWord
(global-set-key (kbd "M-h") 'backward-kill-word)

;; goto-line
(global-set-key (kbd "M-g") 'goto-line)

;; newline-and-indent
(global-set-key (kbd "C-m") 'newline-and-indent)

