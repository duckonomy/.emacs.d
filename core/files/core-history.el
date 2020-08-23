(setq history-length 1000)
(use-package savehist
  :init
  (savehist-mode)
  :config
  (savehist-mode t)
  (setq savehist-additional-variables '(search ring regexp-search-ring)
	savehist-autosave-interval 60
	savehist-save-minibuffer-history t)
  )

(provide 'core-history)
