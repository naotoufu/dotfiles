;; 端末エミュレータ
;; http://www.emacswiki.org/emacs/multi-term.ela
(when (require 'multi-term nil t)
  (cond
   ((eq window-system 'w32)
    (setq multi-term-program "C:/cygwin/bin/zsh.exe"))
   ((or (eq window-system 'ns) (eq window-system 'mac))
    (setq multi-term-program "/bin/zsh.exe"))))

