(setq load-path (cons "~/site-lisp/yatex") load-path))

;; YaTeX-mode
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-latex-message-code 'utf-8)
 (setq tex-command "ptex2pdf -u -l -ot \"-kanji=utf8 -no-guess-input-enc -synctex=1\"")
;; (setq tex-command "pdflatex -synctex=1")
;; (setq tex-command "lualatex -synctex=1")
;; (setq tex-command "luajitlatex -synctex=1")
;; (setq tex-command "xelatex -synctex=1")
;; (setq tex-command "make")
(setq dvi2-command "xdvi"
;;      tex-command "platex"
      dviprint-command-format "dvips %s | lpr"
      YaTeX-kanji-code 3)

;; YaHtml-mode
;; (setq auto-mode-alist
;;       (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
;; (autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
;; (setq yahtml-www-browser "netscape")

;; http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?YaTeX#j78164d5
;;;   nil=YaTeX-kanji-code が nil なら coding-system に感知しない
;;;   0=no-converion -> Emacs内部で使用されている文字コード (Emacs23ではutf-8-emacs)
;;;   1=Shift JIS (Shift_JIS)
;;;   2=JIS (ISO-2022-JP)
;;;   3=EUC (EUC-JP)
;;;   4=UTF-8
(setq YaTeX-kanji-code 4)
