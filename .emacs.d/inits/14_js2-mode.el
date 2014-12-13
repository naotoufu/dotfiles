;; ------------------------------------------------------------------------
;; @ js2-mode.el

;; JavaScriptのメジャーモード
;; https://raw.github.com/mooz/js2-mode/master/js2-mode.el

;; autoload-if-found
(defun autoload-if-found (function file &optional docstring interactive type)
  "set autoload iff. FILE has found."
  (and (locate-library file)
       (autoload function file docstring interactive type)))
;; 使い方
;; 引数は autoload と全く同じです。-if-found を付けるだけ
(when (autoload-if-found 'bs-show "bs" "buffer selection" t)
  ;; autoload は成功した場合のみ non-nil を返すので、
  ;; when の条件部に置くことで、依存関係にある設定項目を自然に表現できます。
  (global-set-key [(control x) (control b)] 'bs-show)
  (setq bs-max-window-height 10))

;;javascript major mode
(when (autoload-if-found 'js2-mode "js2-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

