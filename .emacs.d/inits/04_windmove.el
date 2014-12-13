;; ------------------------------------------------------------------------
;; 反対側のウィンドウにいけるように
(setq windmove-wrap-around t)
;; C-M-{h,j,k,l}でウィンドウ間を移動
(define-key global-map (kbd "C-M-k") 'windmove-up)
(define-key global-map (kbd "C-M-j") 'windmove-down)
(define-key global-map (kbd "C-M-l") 'windmove-right)
(define-key global-map (kbd "C-M-h") 'windmove-left)

;;WindMove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

