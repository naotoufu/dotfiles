;; http://www.emacswiki.org/emacs/auto-async-byte-compile.el

;; (when (require 'auto-async-byte-compile nil t)
;;   ;; 自動コンパイルを無効にするファイル名の正規表現
;;   (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;;   (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))


(require 'auto-async-byte-compile nil t)
  ;; 自動コンパイルを無効にするファイル名の正規表現
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
