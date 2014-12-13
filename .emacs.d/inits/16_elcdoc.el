(load "c-eldoc")
(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'eldoc-idle-delay) 0.20)
            (c-turn-on-eldoc-mode)
            ))
;(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
