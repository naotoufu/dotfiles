;; ------------------------------------------------------------------------
;; @ color-moccur.el/moccur-edit.el

;; バッファの検索結果をリストアップ(複数バッファ可)
;; http://www.emacswiki.org/emacs/color-moccur.el
;; http://www.emacswiki.org/emacs/moccur-edit.el
(when (and (require 'color-moccur nil t)
           (require 'moccur-edit nil t))
  ;; AND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のときに除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  ;; Migemoを利用できる環境であればMigemoを使う
  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (setq moccur-use-migemo t)))

