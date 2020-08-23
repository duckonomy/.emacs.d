(use-package "startup"
  :straight (:type built-in)
  :config
  (setq inhibit-startup-screen t)
  (setq inhibit-startup-echo-area-message "")
  (setq initial-scratch-message "")
  (setq initial-major-mode (quote text-mode)))

(provide 'core-startup)
