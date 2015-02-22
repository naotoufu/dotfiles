;; load-path
;; (dolist (dir (split-string (shell-command-to-string "find ~/Dropbox/.emacs.d/elpa/helm* -type d") "\n"))
;;   (add-to-list 'load-path dir))

;;; helm
(require 'helm)
(require 'helm-config)

;; customize
 ;; (progn
 ;;   (require 'helm-ls-git)
 ;;   (custom-set-variables
 ;;   '(helm-truncate-lines t)
 ;;   '(helm-buffer-max-length 35)
 ;;   '(helm-delete-minibuffer-contents-from-point t)
 ;;   '(helm-ff-skip-boring-files t)
 ;;   '(helm-boring-file-regexp-list '("~$" "\\.elc$"))
 ;;   '(helm-ls-git-show-abs-or-relative 'relative)
 ;;   '(helm-mini-default-sources '(helm-source-buffers-list
 ;;                                 helm-source-ls-git
 ;;                                 helm-source-recentf
 ;;                                 helm-source-buffer-not-found))))

;; set helm-command-prefix-key to "C-z"
 ;; (progn
   ;; (require 'helm-config)
   ;; (global-unset-key (kbd "C-z"))
   ;; (custom-set-variables
   ;;  '(helm-command-prefix-key "C-z")))

;; migemo が設定されているなら有効になる
;;(require 'helm-migemo)

;; (require 'helm-files)
;; (require 'helm-ag)
; agのデフォルトのコマンドオプションを指定
; -nを消すとサブディレクトリも再帰的に検索します
;; (setq helm-ag-base-command "ag --nocolor --nogroup -n")

;; key settings
;; ;(global-set-key (kbd "C-q") 'helm-mini)
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;; (global-set-key (kbd "C-x C-r") 'helm-recentf)
;; (define-key global-map (kbd "C-c i")   'helm-imenu)
;; (define-key global-map (kbd "C-x b")   'helm-buffers-list)
;; (define-key helm-command-map (kbd "d") 'helm-descbinds)
;; (define-key helm-command-map (kbd "g") 'helm-ag)
;; (define-key helm-command-map (kbd "o") 'helm-occur)
;; (define-key helm-command-map (kbd "y") 'yas/insert-snippet)
;; (define-key helm-command-map (kbd "M-/") 'helm-dabbrev)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
;;(define-key helm-map (kbd "C-S-h") 'help-command)
(define-key helm-map (kbd "C-S-h") 'helm-M-x-help)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
;;(define-key helm-find-files-map (kbd "C-S-h") 'help-command)
(define-key helm-find-files-map (kbd "C-S-h") 'helm-M-x-help)
;; ;;(define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)
