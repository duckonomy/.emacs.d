(use-package delsel
  :straight (:type built-in)
  :general
  (:keymaps mode-specific-map
	    "C-g" 'minibuffer-keyboard-quit)
  :config
  (add-hook 'after-init-hook 'delete-selection-mode))

(provide 'core-delsel)
