;; (use-package mood-line
;;   :straight t
;;   :config
;;   (mood-line-mode)
;; )

;; (use-package simple-modeline
;;   :straight t
;;   :hook
;;   (after-init . simple-modeline-mode))

(use-package doom-modeline
  :straight t
  :init
  (doom-modeline-mode)
  :config
  (setq doom-modeline-icon t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon nil)
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-persp-name t)
  (setq doom-modeline-lsp t)
  (setq doom-modeline-github t)
  (setq doom-modeline-height 60)
  (setq doom-modeline-bar-width 8))

(use-package minions
  :straight t
  :init
  (minions-mode 1)
  :config
  (setq minions-mode-line-lighter "#"))

(provide 'modules-modeline)
