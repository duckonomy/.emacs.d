(use-package eldoc
  :straight (:type built-in)
  :diminish eldoc-mode
  :init
  (global-eldoc-mode +1)
  :config
  (setq eldoc-idle-delay 0.4))

(provide 'core-eldoc)
