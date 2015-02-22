;; package.el setting
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(setq package-user-dir "/Users/naoto/.emacs.d/elpa")
(package-initialize)


;; パッケージ情報の更新
;;(package-refresh-contents)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;;;; for auto-complete
    auto-complete fuzzy popup pos-tip

    ;;;; buffer utils
    popwin elscreen yascroll buffer-move

    ;;;; flymake
    flycheck flymake-jslint

    ;;;; go
    go-mode

    ;;;; python
    jedi

    ;;;; helm
    helm ;; helm-ag helm-descbinds helm-ls-git

    ;;;; git
    magit git-gutter

    ;;;; snippet
    yasnippet

    ;;;;mode
    js2-mode ruby-mode cperl-mode

    ;; eldoc
    eldoc-extension

    ;;etc
    auto-async-byte-compile
    direx
    init-loader
    markdown-mode
    open-junk-file
    recentf-ext
    color-theme
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))


; init loader
;;~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "/Users/naoto/.emacs.d/site-lisp"))))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path))

(require 'init-loader)
(custom-set-variables
 '(init-loader-show-log-after-init nil))
(init-loader-load "/Users/naoto/.emacs.d/inits/")

;; OSごとに異なる設定ファイルを読み込む
(cond
 ((eq window-system 'w32)
  (load "/Users/naoto/.emacs.d/init-windows"))
 ((or (eq window-system 'ns) (eq window-system 'mac))
  (load "/Users/naoto/.emacs.d/init-macos")))

;; after init
(add-hook 'after-init-hook
  (lambda ()
    ;; split window
    (split-window-horizontally)
    ;; show init time
    ;; (message "init time: %.3f sec"
    ;;          (float-time (time-subtract after-init-time before-init-time)))
    ))
