(use-package visual-bell
  :straight (:type built-in)
  :defer t
  :config
  (setq visible-bell nil)
  (setq ring-bell-function 'ignore))

(provide 'core-visual-bell)
