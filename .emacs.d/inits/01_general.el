; common lisp
(require 'cl)

;; Character code
(set-language-environment "Japanese")
(let ((ws window-system))
  (cond ((eq ws 'w32)
         (prefer-coding-system 'utf-8-unix)
         (set-default-coding-systems 'utf-8-unix)
         (setq default-process-coding-system '(utf-8 . utf-8))
         (setq file-name-coding-system 'utf-8)
         (setq locale-coding-system 'utf-8))
        ((eq ws 'ns)
         (require 'ucs-normalize)
         (prefer-coding-system 'utf-8-hfs)
         (setq file-name-coding-system 'utf-8-hfs)
         (setq locale-coding-system 'utf-8-hfs))))

;; eshell encoding utf8
;; (add-hook 'set-language-environment-hook 
;;           (lambda ()
;;             (when (equal "ja_JP.UTF-8" (getenv "LANG"))
;;              (setq default-process-coding-system '(utf-8 . utf-8))
;;              (setq default-file-name-coding-system 'utf-8))
;;             (when (equal "Japanese" current-language-environment)
;;              (setq default-buffer-file-coding-system 'iso-2022-jp))))


;; Specify eiryo in Japanese and alphanumeric in Windows
;; Specify Ricty to Japanese and British number of Mac
;; (let ((ws window-system))
;;   (cond ((eq ws 'w32)
;;          (set-face-attribute 'default nil
;;                              :family "Consolas"  ;; 英数
;;                              :height 104)

;;          ;; (set-face-attribute 'default nil
;;          ;;                     :family "eiryo"  ;; 英数
;;          ;;                     :height 100)

;; ;;         (setq face-font-rescale-alist '(("MeiryoKe_Console" . 1.08))))

;;          (set-fontset-font nil 'japanese-jisx0208 (font-spec
;;                                                    :family "eiryo"))  ;; 日本語

;;          ;; (set-fontset-font nil 'japanese-jisx0208 (font-spec
;;          ;;                                           :family "MeiryoKe_Console"))

;;         ((eq ws 'ns)
;;          (set-face-attribute 'default nil
;;                              :family "Ricty"  ;; 英数
;;                              :height 140)
;;          (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty"))))) ;; 日本語

  (let ((ws window-system))
  (cond ((eq ws 'w32)
         (set-face-attribute 'default nil
                             :family "Meiryo"  ;; 英数
                             :height 100)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Meiryo")))  ;; 日本語
        ((eq ws 'ns)
         (set-face-attribute 'default nil
                             :family "Ricty"  ;; 英数
                             :height 140)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))))  ;; 日本語

;; フォント
;; abcdefghijklmnopqrstuvwxyz 
;; ABCDEFGHIJKLMNOPQRSTUVWXYZ
;; 1234567890
;; ~!@#$%^&*()_+|{}:"<>?
;;
;; 壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五
;; 123456789012345678901234567890123456789012345678901234567890
;; ABCdeＡＢＣｄｅ
;;
;; ┌─────────────────────────────┐
;; │　　　　　　　　　　　　　罫線                            │
;; └─────────────────────────────┘
;;

;;
;; リストを評価する(Ctrl-j)
;;   フォントファミリ (pp (font-family-list))
;;   文字セット       (pp (charset-list))
;;   フェース         (pp (face-list))


;; 日本語入力
;; (setq default-input-method "W32-IME")
;; (setq-default w32-ime-mode-line-state-indicator "[--]")
;; (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
;; (w32-ime-initialize) 
;; (global-set-key [M-kanji] 'ignore)


;; Hide startup
(setq inhibit-startup-screen t)

;; Erase the initial message of scratch
(setq initial-scratch-message "")

;; (GNU Emacs, Emacs for Mac) toolbar hide
(tool-bar-mode -1)

;; (GNU Emacs, Emacs for Mac) scroll bar hidden
(set-scroll-bar-mode nil)

;; Hide menubar
;(menu-bar-mode -1)

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
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

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

;; Leaving no backup
                                        ;(setq make-backup-files nil)

;; Space between lines ;;行の間隔?
                                        ;(setq-default line-spacing 0(setq make-backup-files nil))

;; Scroll one line at a time ;;1行ずつスクロール
;; (setq scroll-conservatively 35
;;       scroll-margin 0
;;       scroll-step 1)
;; (setq comint-scroll-show-maximum-output t) ;; shell-mode

;; Transparency of the frame
                                        ;(set-frame-parameter (selected-frame) 'alpha '(0.85))

;; The line number displayed in the mode line
(line-number-mode t)

;; The column number displayed in the mode line
(column-number-mode t)

;; Rectangle selected in the C-RET ;;C-RET で矩形選択
;; Detailed key bind operation：http://dev.ariel-networks.com/articles/emacs/part5/
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;; winner-mode
(when (fboundp 'winner-mode)
  (winner-mode t))

;; global high light line mode
(global-hl-line-mode 0)

;; kill whole line
(setq kill-whole-line t)

;; message log max
(setq message-log-max 10000)

;; rainbow-delimiters-mode
; (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

;; server start for emacs-client
(require 'server)
;; (setq server-socket-dir "~/Dropbox/.emacs.d/server")
(unless (server-running-p)
  (server-start))

;; cldoc
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
