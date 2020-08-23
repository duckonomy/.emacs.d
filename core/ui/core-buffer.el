(use-package buffer
  :straight (:type built-in)
  :defer t
  :config
  ;; (setq uniquify-buffer-name-style 'forward "Make redundant buffers unique")
  ;; (setq indicate-buffer-boundaries nil "Don't show where buffer starts/ends")
  (setq uniquify-buffer-name-style 'forward)
  (setq indicate-buffer-boundaries nil))

(provide 'core-buffer)
