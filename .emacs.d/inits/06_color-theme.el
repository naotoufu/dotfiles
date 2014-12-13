;; http://code.google.com/p/gnuemacscolorthemetest/
(when (and (require 'color-theme nil t) (window-system))
  (color-theme-initialize)
  (color-theme-clarity))

;; 括弧の範囲色
(set-face-background 'show-paren-match-face "#500")
;; 選択領域の色
(set-face-background 'region "#555")

