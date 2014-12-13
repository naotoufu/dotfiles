;; ------------------------------------------------------------------------
;; @ uniquify.el

;; 同名バッファを分りやすくする
 (require 'uniquify)
;; (setq uniquify-buffer-name-style 'forward)
 (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
 (setq uniquify-ignore-buffers-re "*[^*]+*")

