(use-package buffer
  :ensure nil
  :defer t
  :config
  (setq uniquify-buffer-name-style 'forward "Make redundant buffers unique")
  (setq indicate-buffer-boundaries nil "Don't show where buffer starts/ends"))

(provide 'core-buffer)
