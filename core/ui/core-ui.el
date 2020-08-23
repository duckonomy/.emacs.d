(use-package tool-bar
  :straight (:type built-in)
  :init
  (tool-bar-mode -1))

(use-package scroll-bar
  :straight (:type built-in)
  :init
  (scroll-bar-mode -1))

(use-package menu-bar
  :straight (:type built-in)
  :init
  (menu-bar-mode -1))

(use-package fringe
  :straight (:type built-in)
  :init
  (set-fringe-style -1)
  (fringe-mode '(0 . 0))
  :config
  ;; Remove continuation arrow on right fringe. Overflowing text when word wrap is off
  (setq frame-inhibit-implied-resize t)
  (setq fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
				     fringe-indicator-alist)))

(use-package tooltip
  :straight (:type built-in)
  :init
  (tooltip-mode -1)
  :config
  (setq x-gtk-use-system-tooltips nil))

(provide 'core-ui)
