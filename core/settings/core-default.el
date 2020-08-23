(use-package emacs
  :config
  (setq use-dialog-box nil)
  (setq debug-on-quit nil)
  (setq show-help-function nil)
  (setq sentence-end-double-space nil)
  (setq indicate-empty-lines nil)
  (setq confirm-kill-emacs nil)
  (fset 'yes-or-no-p 'y-or-n-p)
  (put 'narrow-to-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  )

(provide 'core-default)
