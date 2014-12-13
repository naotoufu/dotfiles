;;; TRAMP for remote editing ;;;
;; (setq exec-path (cons "c:/Program Files (x86)/PuTTY" exec-path))
;; (setenv "PATH"
;;   (concat
;;    "C:\\Program Files\\PuTTY" ";"
;;    "C:\\cygwin\\usr\\local\\bin" ";"
;;    "C:\\cygwin\\usr\\bin" ";"
;;    "C:\\cygwin\\bin" ";"
;;    "C:\\Users\\netforce\\bin" ";"
;;    (getenv "PATH")))

;; (require 'tramp)
;; (setq tramp-default-method "plink"
;;       tramp-default-user "root"
;;       tramp-default-host "192.168.30.90"
;;       tramp-shell-prompt-pattern "^[ $]+")

;; (setq tramp-debug-buffer t)
;; (setq tramp-verbose 9)

(require 'tramp)
(setq tramp-default-method "wssh")
(modify-coding-system-alist 'process "plink" 'utf-8-unix)
(setq tramp-completion-without-shell-p t)
(setq tramp-shell-prompt-pattern "^[ $]+")
;; add "wssh" to tramp-methods
(add-to-list 'tramp-methods
             `("wssh"
               (tramp-login-program        "plink")
               (tramp-login-args           (("-l" "%u") ("-P" "%p")
;                                            ("-i" ,(expand-file-name "~/.ssh/id_rsa.ppk")) ; 鍵の場所
                                            ("-ssh") ("%h")))
               (tramp-remote-sh            "/bin/sh")
               (tramp-copy-program         nil)
               (tramp-copy-args            nil)
               (tramp-copy-keep-date       nil)
               (tramp-password-end-of-line "xy")
               (tramp-default-port         22)))


;; Ctrl + \ IME切り換え
;; (prefer-coding-system 'utf-8-unix)	; 日本語入力のための設定
;; (set-default-font "ＭＳ ゴシック-10.5")
;; (setq default-input-method "W32-IME")	;標準IMEの設定
;; (w32-ime-initialize)			;IMEの初期化
;; (set-cursor-color "red")		;IME OFF時の初期カーソルカラー
;; (setq w32-ime-buffer-switch-p nil)	;バッファ切り替え時にIME状態を引き継ぐ

;; ;IME ON/OFF時のカーソルカラー
;; (add-hook 'input-method-activate-hook
;; 	  (lambda() (set-cursor-color "green")))
;; (add-hook 'input-method-inactivate-hook
;; 	  (lambda() (set-cursor-color "red")))
