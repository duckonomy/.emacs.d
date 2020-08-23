(use-package imenu
  :straight t
  )

(use-package imenu-list
  :straight t
  :config
  ;; (global-set-key (kbd "C-'") #'imenu-list-smart-toggle)
  (setq imenu-list-focus-after-activation t)
  (setq imenu-list-auto-resize t)
  (setq imenu-list-after-jump-hook nil)
  (setq imenu-list-after-jump-hook nil)
  (add-hook 'imenu-list-after-jump-hook #'recenter-top-bottom)
  )

(provide 'modules-imenu)
