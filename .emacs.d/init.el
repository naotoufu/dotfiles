(eval-when-compile (require 'cl))

;; package.el setting
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(cond ((>= (string-to-number emacs-version) 24.3)
       (add-to-list 'package-obsolete-alist "cl-lib-0.5"))
      (t
       (load "~/.emacs.d/elpa/cl-lib-0.5/cl-lib")
       ;; kbd のエイリアス（上記で説明したもの）を行う場合は、以下をアンコメントする
       ;; (defalias 'kbd 'read-kbd-macro)
       ))
(setq package-user-dir ("~/.emacs.d/elpa/"))
(package-initialize)


;; install if not installed
(defvar my-package-list
  '(auto-async-byte-compile
    auto-complete
    cperl-mode
    direx
    helm
    helm-ag
    helm-descbinds
    helm-ls-git
    init-loader
    js2-mode
    magit
    markdown-mode
    open-junk-file
    recentf-ext
    ruby-mode
    yasnippet
    eldoc-extension
    ))
(let ((not-installed
       (loop for package in my-package-list
             when (not (package-installed-p package))
             collect package)))
  (when not-installed
    (package-refresh-contents)
    (dolist (package not-installed)
      (package-install package))))


; init loader
;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp"))))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(custom-set-variables
 '(init-loader-show-log-after-init nil))
(init-loader-load ("~/.emacs.d/inits/"))

;; OSごとに異なる設定ファイルを読み込む
(cond
 ((eq window-system 'w32)
  (load "~/.emacs.d/init-windows"))
 ((or (eq window-system 'ns) (eq window-system 'mac))
  (load "~/.emacs.d/init-macos")))

;; after init
(add-hook 'after-init-hook
  (lambda ()
    ;; split window
    (split-window-horizontally)
    ;; show init time
    (message "init time: %.3f sec"
             (float-time (time-subtract after-init-time before-init-time)))))

