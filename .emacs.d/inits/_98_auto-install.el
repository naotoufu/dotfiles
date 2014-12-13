;; automate the installation of the package
;; http://www.emacswiki.org/emacs/auto-install.el
(when (require 'auto-install nil t)
;;(setq auto-install-directory "~/.emacs.d/auto-install/")
(setq auto-install-directory (concat dropbox-emacs-dir "/site-lisp/")) ; auto-installのディレクトリ先をDropboxのelispディレクトリにする
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup))
