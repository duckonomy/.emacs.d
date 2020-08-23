(use-package performance
  :defer t
  :config
  (setq bidi-display-reordering nil)
  (setq redisplay-dont-pause t)
  )

(use-package jit-lock
  :config
  (setq jit-lock-defer-time nil)
  (setq jit-lock-stealth-nice 0.1)
  (setq jit-lock-stealth-time 0.2)
  ;; (setq jit-lock-stealth-fontify)
  (setq jit-lock-stealth-verbose nil)
  )

(use-package async
  :straight t
  :config
  (async-bytecomp-package-mode 1)
  )

(provide 'core-performance)
