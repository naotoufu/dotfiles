  (require 'auto-complete-latex)
  (setq ac-l-dict-directory "~/.emacs.d/elisp/auto-complete-latex/ac-l-dict/")
  (add-to-list 'ac-modes 'latex-mode)
  (add-hook 'latex-mode-hook 'ac-l-setup)
    ;; for YaTeX
          ;; (when (require 'auto-complete-latex nil t)
          ;;   (setq ac-l-dict-directory "~/.emacs.d/site-lisp/auto-complete-latex/ac-l-dict/")
          ;;   (add-to-list 'ac-modes 'yatex-mode)
          ;;   (add-hook 'yatex-mode-hook 'ac-l-setup))
