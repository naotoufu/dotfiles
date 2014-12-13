;; ;; C-c C-cでPDFプレビュー
;; (add-hook 'yatex-mode-hook 
;;           (define-key YaTeX-mode-map "\C-c\C-c" 'tex-pdf-preview))
;; ;; (defvar tex2pdf-path "c:/usr/local/scripts/tex2pdf.sh")
;; (defvar tex2pdf-path (expand-file-name "~/bin/tex2pdf.sh"))
;; (defun tex-pdf-preview ()
;;   (interactive)
;;   (if (buffer-modified-p) (save-buffer))
;;   (if (get-process "tex2pdf") (delete-process "tex2pdf"))
;;   (start-process "tex2pdf" "tex2pdf" "sh" "tex2pdf.sh" buffer-file-name))
