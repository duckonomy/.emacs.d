(use-package visual-bell
  :defer t
  :config
  (setq visible-bell nil)
  (setq ring-bell-function 'ignore))

(provide 'core-visual-bell)
