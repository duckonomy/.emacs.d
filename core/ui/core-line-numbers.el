(use-package display-line-numbers
  :hook
  (prog-mode . display-line-numbers-mode)
  :config
  (setq display-line-numbers-width nil)
  (setq display-line-numbers-width-start t))

(provide 'core-line-numbers)
