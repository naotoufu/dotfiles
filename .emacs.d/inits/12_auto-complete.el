(require 'auto-complete-config nil 'noerror)
(add-to-list 'ac-dictionary-directories
              "~/ac-dict")
(setq ac-comphist-file
              "~/ac-dict")
(ac-config-default)
(ac-flyspell-workaround)

;; 全てのモードで補完を有効に
(global-auto-complete-mode t)
;; 追加メジャーモード
(add-to-list 'ac-modes 'org-mode)

;; 起動/キー設定など
;; `<s’補完などを使うために 4 文字以上で起動することにする 補完メニュー表示時には C-n/C-p で選択.
(setq ac-auto-start 4)                         ; 4 文字以上で起動
(setq ac-auto-show-menu 0.8)                   ; 0.8秒でメニュー表示
(setq ac-use-comphist t)                       ; 補完候補をソート
(setq ac-candidate-limit nil)                  ; 補完候補表示を無制限に
(setq ac-use-quick-help nil)                   ; tool tip 無し
(setq ac-use-menu-map t)                       ; キーバインド
(define-key ac-menu-map (kbd "C-n")         'ac-next)
(define-key ac-menu-map (kbd "C-p")         'ac-previous)
(define-key ac-completing-map (kbd "<tab>") 'nil)
;; (define-key ac-completing-map (kbd "<tab>") 'ac-complete)
(define-key ac-completing-map (kbd "M-/")   'ac-stop)
(define-key ac-completing-map (kbd "RET") nil) ; return での補完禁止
(setf (symbol-function 'yas-active-keys)
      (lambda ()
        (remove-duplicates
         (mapcan #'yas--table-all-keys (yas--get-snippet-tables)))))
