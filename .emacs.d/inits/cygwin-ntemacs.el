;; ------------------------------------------------------------------------
;; Cygwin は C:\cygwin(デフォルト)にインストールされており、
;; C:\cygwin\bin が既に Windows パスに含まれていないことを
;; 仮定しています(一般にはそうではない筈ですが)。
;; (setq exec-path (cons "C:/cygwin/bin" exec-path))
;; (setenv "PATH" (concat "C:\\cygwin\\bin;" (getenv "PATH")))

;; ;; NT-emacs は、ここで変更する Windows コマンドシェルを
;; ;; 使用します。
;; (setq process-coding-system-alist '(("bash" . undecided-unix)))
;; (setq shell-file-name "bash")
;; (setenv "SHELL" shell-file-name) 
;; (setq explicit-shell-file-name shell-file-name) 

;; これは、Java アプリケーションの出力に出現する
;; 見苦しい ^M 文字を削除します。
;; (add-hook 'comint-output-filter-functions)

  ;;;;
  ;;;; cygwin support
  ;;;;          'comint-strip-ctrl-m)

;; Sets your shell to use cygwin's bash, if Emacs finds it's running
  ;; under Windows and c:\cygwin exists. Assumes that C:\cygwin\bin is
  ;; not already in your Windows Path (it generally should not be).
  ;;
  ;; (let* ((cygwin-root "c:/cygwin")
  ;;        (cygwin-bin (concat cygwin-root "/bin")))
  ;;   (when (and (eq 'windows-nt system-type)
  ;; 	     (file-readable-p cygwin-root))

  ;;     (setq exec-path (cons cygwin-bin exec-path))
  ;;     (setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))

  ;;     ;; By default use the Windows HOME.
  ;;     ;; Otherwise, uncomment below to set a HOME
  ;;     ;;      (setenv "HOME" (concat cygwin-root "/home/eric"))

  ;;     ;; NT-emacs assumes a Windows shell. Change to bash.
  ;;     (setq shell-file-name "bash")
  ;;     (setenv "SHELL" shell-file-name) 
  ;;     (setq explicit-shell-file-name shell-file-name) 

  ;;     ;; This removes unsightly ^M characters that would otherwise
  ;;     ;; appear in the output of java applications.
  ;;     (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))
