 ;; (autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;; (setq auto-mode-alist (cons '("\\.html$" . html-helper-mode)       auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.asp$" . html-helper-mode)        auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.phtml$" . html-helper-mode)      auto-mode-alist))

;; (defvar html-helper-new-buffer-template
;;   '("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\">\n"
;;     "<html lang=\"ja\">\n"
;;     "<head>\n"
;;     "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=EUC-JP\">\n"
;;     "<title>" p "</title>\n"
;;     "<link rel=\"stylesheet\" type=\"text/css\" href=\"/~okumura/style.css\">\n"
;;     "<script type=\"text/javascript\" src=\"/~okumura/head.js\"></script>\n"
;;     "</head>\n"
;;     "<body>\n\n<h1>" p "</h1>\n\n" p
;;     "\n\n<hr>\n\n<p class=\"noindent\">リンクはご自由にどうぞ。\n\n"
;;     "<p class=\"noindent\"><a href=\"http://www.matsusaka-u.ac.jp/\">松阪大学</a>\n"
;;     "<a href=\"/~okumura/\">奥村晴彦</a>\n"
;;     "<a href=\"mailto:okumura@matsusaka-u.ac.jp\">"
;;     "okumura@matsusaka-u.ac.jp</a>\n\n"
;;     "<p class=\"noindent\">\n"
;;     html-helper-timestamp-start
;;     html-helper-timestamp-end
;;     "\n</body>\n</html>\n")
;;   "*Template for new buffers, inserted by html-helper-insert-new-buffer-strings if
;; html-helper-build-new-buffer is set to t")


;; (add-hook 'html-helper-timestamp-hook
;; 	  (function (lambda ()
;; 		      (insert "Last modified: "
;; 			      (format-time-string "%Y-%m-%d %T\n")))))
