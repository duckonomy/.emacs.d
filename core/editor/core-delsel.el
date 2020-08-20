(use-package delsel
  :ensure nil
  :bind
  (:map mode-specific-map
		("C-g" . minibuffer-keyboard-quit))
  :config
  (add-hook 'after-init-hook 'delete-selection-mode))

(provide 'core-delsel)
