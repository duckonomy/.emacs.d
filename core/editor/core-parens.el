(use-package paren
  :defer t
  :init
  (show-paren-mode t)
  :config
  (setq show-paren-delay 0)
  (setq show-paren-highlight-openparen t)
  (setq show-paren-when-point-inside-paren t))

(provide 'core-parens)
