;; EmacsのWindowを一番上に表示
(x-focus-frame nil)

(setq ns-use-native-fullscreen nil)

;;; 初期フレームの設定
(setq initial-frame-alist
      (append
       '((top                 . 1)    ; フレームの Y 位置(ピクセル数)
	 (left                . 1)   ; フレームの X 位置(ピクセル数)
	 (width               . 150)    ; フレーム幅(文字数)
	 (height              . 47))   ; フレーム高(文字数)
       initial-frame-alist))

;; Mac用フォント設定
;; http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/

 ;; 英語
 (set-face-attribute 'default nil
             :family "Menlo" ;; font
             :height 150)    ;; font size

;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
  (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;; 半角と全角の比を1:2にしたければ
;; (setq face-font-rescale-alist
;; ;;        '((".*Hiragino_Mincho_pro.*" . 1.2)))
;;       '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)))
;; Mac用フォント設定


;; set no beep sound
(setq ring-bell-function 'ignore)

;; set visible beep
;(setq visible-bell t)

;; ispell for Mac
(setq ispell-program-name "/opt/local/bin/aspell")
