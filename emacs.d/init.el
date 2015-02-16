;; @ key bind
; enable-BackSpace
(global-set-key "\C-h" 'delete-backward-char)

;; goto-line
(global-set-key (kbd "M-g") 'goto-line)


;; package.el setting
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;;;; for auto-complete
    ;; auto-complete fuzzy popup pos-tip

    ;;;; buffer utils
    ;; popwin elscreen yascroll buffer-move

    ;;;; flymake
    flycheck ;; flymake-jslint

    ;;;; go
    ;; go-mode

    ;;;; python
    ;; jedi

    ;;;; helm
    helm ;; helm-ag helm-descbinds helm-ls-git

    ;;;; git
    magit ;;git-gutter

    ;;;; snippet
    ;; yasnippet

    ;;;;mode
    ;; js2-mode ruby-mode cperl-mode 

    ;; doc
    eldoc
    eldoc-extension
    c-eldoc
    

    ;;;;etc
    ;; auto-async-byte-compile
    ;; direx
    ;; init-loader
    ;; markdown-mode
    ;; open-junk-file
    ;; recentf-ext
    color-theme
    point-undo
    redo+
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))



;; helm
(require 'helm-config)


;;color theme
(when (and (require 'color-theme nil t) (window-system))
  (color-theme-initialize)
  (color-theme-clarity))

;; 括弧の範囲色
(set-face-background 'show-paren-match-face "#500")
;; 選択領域の色
(set-face-background 'region "#555")

;; Hide startup
(setq inhibit-startup-screen t)

;; Erase the initial message of scratch
(setq initial-scratch-message "")

;; Full path of the file displayed in the title bar
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))
;; Line number display
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#800"
                    :height 0.9)

;; Line number format
(setq linum-format "%4d")

;; Highlight the range of brackets
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; Color in the range of brackets
(set-face-background 'show-paren-match-face "#500")

;; Color of the selected region
(set-face-background 'region "#555")

;; Highlight trailing whitespace
;; (setq-default show-trailing-whitespace t)
;; (set-face-background 'trailing-whitespace "#b14770")

;; deal with a tab as whitespace
(setq-default indent-tabs-mode nil)

;; Tab Width
; (custom-set-variables '(tab-width 4))

;; yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)
(defalias 'yes-or-no-p 'y-or-n-p)
;; View on the Recent Documents menu
(when (require 'recentf nil t)
  ;; increase the number of saved most recently opened files
  (setq recentf-max-saved-items 3000)
  ;; Display the number of recently used files
  (setq recentf-max-menu-items 10)
  (setq recentf-save-file "~/.recentf")
  ;; (setq recentf-exclude '(".recentf"))
  ;; (setq recentf-auto-cleanup 10)
   (setq recentf-auto-cleanup 'never)
  ;; (setq recentf-auto-cleanup '12:00pm)
  ;; (run-with-idle-timer 30 t 'recentf-save-list)
  )
(recentf-mode 1)

;; save the history of the mini-buffer
(savehist-mode 1)

;; increase the number of saved history of mini-buffer
(setq history-length 3000)

;; Leaving no history duplicate
(setq history-delete-duplicates t)

;; The line number displayed in the mode line
(line-number-mode t)

;; The column number displayed in the mode line
(column-number-mode t)
;;; winner-mode
(when (fboundp 'winner-mode)
  (winner-mode t))

;; global high light line mode
(global-hl-line-mode 0)

;; kill whole line
(setq kill-whole-line t)

;; message log max
(setq message-log-max 10000)
;; server start for emacs-client
(require 'server)
;; (setq server-socket-dir "~/Dropbox/.emacs.d/server")
(unless (server-running-p)
  (server-start))


;;point-undo
(require 'point-undo)
(define-key global-map [f12] 'point-undo)
(define-key global-map [S-f12] 'point-redo)

;;redo
(when (require 'redo+ nil t)
  (define-key global-map (kbd "C-_") 'redo))

;; uniquify
 (require 'uniquify)
;; (setq uniquify-buffer-name-style 'forward)
 (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
 (setq uniquify-ignore-buffers-re "*[^*]+*")

;;c-eldoc
(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'eldoc-idle-delay) 0.20)
            (c-turn-on-eldoc-mode)
            ))
;(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

;; eldoc
(require 'eldoc)
(require 'eldoc-extension)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(flycheck-add-next-checker 'javascript-jshint
                           'javascript-gjslint)

;; magit
(require 'magit)
