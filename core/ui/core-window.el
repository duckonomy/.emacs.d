(use-package "windows"
  :straight (:type built-in)
  :config
  (setq highlight-nonselected-windows nil)
  (setq split-width-threshold nil)
  (setq max-mini-window-height 0.3)
  (setq resize-mini-windows 'grow-only))

(provide 'core-window)
