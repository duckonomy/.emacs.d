(use-package counsel :ensure t
  :bind*
  (("M-x"     . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-x C-r" . counsel-recentf)
   ("C-c f"   . counsel-git)
   ("C-c s"   . counsel-git-grep)
   ("C-c /"   . counsel-rg)
   ("C-c z"   . counsel-fzf)
   ("C-c x"   . counsel-file-jump)
   ("C-c l"   . counsel-locate))
  :config
  (setq counsel-find-file-ignore-regexp (regexp-opt '("." ".."))) ; Need for Dired
  (setq counsel-find-file-ignore-regexp (regexp-opt completion-ignored-extensions))
  (setq counsel-find-file-ignore-regexp
		(concat
		 ;; File names beginning with # or .
		 "\\(?:\\`[#.]\\)"
		 ;; File names ending with # or ~
		 "\\|\\(?:\\`.+?[#~]\\'\\)")))

(use-package counsel-projectile
  :ensure t
  :init
  (counsel-projectile-mode 1)
  :bind
  (:map projectile-mode-map
		("C-c p" . projectile-command-map)))

(use-package smex
  :ensure t)

(provide 'modules-counsel)
