;; ;; SQL-mode setting 
;; ;; C-c C-c : 'sql-send-paragraph
;; ;; C-c C-r : 'sql-send-region
;; ;; C-c C-s : 'sql-send-string
;; ;; C-c C-b : 'sql-send-buffer
 (require 'sql)

;; ;; デフォルトのデータベースの設定
;; (setq sql-mysql-options '("-C" "-f" "-t" "-n")) ; for windows
 (setq sql-user "campus")
 (setq sql-database "cf")
 (setq sql-server "192.168.30.100")
;; SQL モードの雑多な設定
(add-hook 'sql-mode-hook
    (function (lambda ()
                (setq sql-indent-offset 4)
                (setq sql-indent-maybe-tab t)
                (local-set-key "\C-cu" 'sql-to-update) ; sql-transform 
                 ;; SQLi の自動ポップアップ
                   (setq sql-pop-to-buffer-after-send-region t)
                ;; master モードを有効にし、SQLi をスレーブバッファにする
                   (master-mode t)
                (master-set-slave sql-buffer)
                ))
    )
(add-hook 'sql-set-sqli-hook
          (function (lambda ()
                      (master-set-slave sql-buffer))))
(add-hook 'sql-interactive-mode-hook
          (function (lambda ()
                      ;; 文字コード
                      (set-buffer-process-coding-system 'utf-8 'utf-8 )
                      (setq show-trailing-whitespace nil)
                      ;; 「;」をタイプしたら SQL 文を実行
                         (setq sql-electric-stuff 'semicolon) 
                      ;; comint 関係の設定
                         (setq comint-buffer-maximum-size 500)
                      (setq comint-input-autoexpand t)
                      (setq comint-output-filter-functions 
                            'comint-truncate-buffer)))
          )


;; starting SQL mode loading sql-indent / sql-complete
(eval-after-load "sql"
  '(progn
     (load-library "sql-indent")
     (load-library "sql-complete")
     (load-library "sql-transform")))
;;
;; SQL server setting
;;

;; (add-hook 'sql-interactive-mode-hook
;;           #'(lambda ()
;;               (interactive)
;;               (set-buffer-process-coding-system 'sjis-unix 'sjis-unix )
;;               (setq show-trailing-whitespace nil)))

(setq auto-mode-alist
      (cons '("\\.sql$" . sql-mode) auto-mode-alist))

(sql-set-product-feature
 'ms :font-lock 'sql-mode-ms-font-lock-keywords)

(defcustom sql-ms-program "sqlcmd"
  "Command to start sqlcmd by SQL Server."
  :type 'file
  :group 'SQL)

(sql-set-product-feature
 'ms :sql-program 'sql-ms-program)
(sql-set-product-feature
 'ms :sqli-prompt-regexp "^[0-9]*>")
(sql-set-product-feature
 'ms :sqli-prompt-length 5)

(defcustom sql-ms-login-params
  '(user password server database)
  "Login parameters to needed to connect to mssql."
  :type '(repeat (choice
                  (const user)
                  (const password)
                  (const server)
                  (const database)))
  :group 'SQL)

(defcustom sql-ms-options '("-U" "-P" "-S" "-d")
  "List of additional options for `sql-ms-program'."
  :type '(repeat string)
  :group 'SQL)

(defun sql-connect-ms ()
  "Connect ti SQL Server DB in a comint buffer."
  ;; Do something with `sql-user', `sql-password',
  ;; `sql-database', and `sql-server'.
  (let ((f #'(lambda (op val)
               (unless (string= "" val)
                 (setq sql-ms-options
                       (append (list op val) sql-ms-options)))))
        (params `(("-U" . ,sql-user)("-P" . ,sql-password)
                  ("-S" . ,sql-server)("-d" . ,sql-database))))
    (dolist (pair params)
      (funcall f (car pair)(cdr pair)))
    (sql-connect-1 sql-ms-program sql-ms-options)))

(sql-set-product-feature
 'ms :sqli-login 'sql-ms-login-params)
(sql-set-product-feature
 'ms :sqli-connect 'sql-connect-ms)

(defun run-mssql ()
  "Run mssql by SQL Server as an inferior process."
  (interactive)
  (sql-product-interactive 'ms))

;; sql-modeのSQLi バッファの出力を折り返しせずに表示
(add-hook 'sql-interactive-mode-hook
          '(lambda()
             (setq truncate-lines t
                   truncate-partial-width-windows t)))

;; mysql option for Windows
(setq sql-mysql-options '("-C" "-t" "-f" "-n"))

;; ------------------------------------------------------------------------
;; ;; SQL モードから SQLi へ送った SQL 文も SQLi ヒストリの対象とする
;; (defadvice sql-send-region (after sql-store-in-history)
;;   "The region sent to the SQLi process is also stored in the history."
;;   (let ((history (buffer-substring-no-properties start end)))
;;     (save-excursion
;;       (set-buffer sql-buffer)
;;       (message history)
;;       (if (and (funcall comint-input-filter history)
;;                (or (null comint-input-ignoredups)
;;                    (not (ring-p comint-input-ring))
;;                    (ring-empty-p comint-input-ring)
;;                    (not (string-equal (ring-ref comint-input-ring 0)
;;                                       history))))
;;           (ring-insert comint-input-ring history))
;;       (setq comint-save-input-ring-index comint-input-ring-index)
;;       (setq comint-input-ring-index nil))))
;; (ad-activate 'sql-send-region)
