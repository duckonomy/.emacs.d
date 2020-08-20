(use-package scroll
  :ensure nil
  :defer t
  :config
  (setq scroll-error-top-bottom t) ;; window.el but no provide
  (setq scroll-conservatively 10000) ;; or 101
  (setq fast-but-imprecise-scrolling t)
  (setq scroll-preserve-screen-position t)
  (setq scroll-margin 10))

(provide 'core-scroll)
