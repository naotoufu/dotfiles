(require 'open-junk-file)
(setq open-junk-file-format (concat dropbox-emacs-dir "/junk/%y%m%d/%H%M%."))
(global-set-key (kbd "C-x C-z") 'open-junk-file)

