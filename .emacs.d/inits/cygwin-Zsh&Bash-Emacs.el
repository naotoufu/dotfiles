;; ------------------------------------------------------------------------
;; Setting you want to use Zsh and Bash in the comfort for Cygwin on Emacs

;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
 ;; PATH と exec-path に同じ物を追加します
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))

(setenv "ANPATH" (concat "/usr/local/man:/usr/share/man:/Developer/usr/share/man:/sw/share/man" (getenv "ANPATH")))

;; ;; shell の存在を確認
(defun skt:shell ()
  (or  (executable-find "zsh")
       (executable-find "bash")
       (executable-find "f_zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
       (executable-find "f_bash") ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
       (executable-find "cmdproxy")
       (error "can't find 'shell' command in PATH!!")))

;; ;; Shell 名の設定
(setq shell-file-name (skt:shell))
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)

(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)

(cond
 ((or (eq window-system 'mac) (eq window-system 'w32))
  ;; Mac OS X の HFS+ ファイルフォーマットではファイル名は NFD (の様な物)で扱うため以下の設定をする必要がある
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))
 (or (eq system-type 'cygwin) (eq system-type 'windows-nt)
  (setq file-name-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  ;; もしコマンドプロンプトを利用するなら sjis にする
  ;; (setq file-name-coding-system 'sjis)
  ;; (setq locale-coding-system 'sjis)
  ;; 古い Cygwin だと EUC-JP にする
  ;; (setq file-name-coding-system 'euc-jp)
  ;; (setq locale-coding-system 'euc-jp)
  )
 (t
  (setq file-name-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)))

 ;; Emacs が保持する terminfo を利用する
 (setq system-uses-terminfo nil)

;; エスケープを綺麗に表示する
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; term 呼び出しキーの割り当て
(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (term shell-file-name)))

