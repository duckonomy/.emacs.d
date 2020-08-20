(use-package visual-bell
  :ensure nil
  :defer t
  :config
  (setq visible-bell nil)
  (setq ring-bell-function 'ignore))

(provide 'core-visual-bell)
