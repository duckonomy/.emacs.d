(use-package counsel
  :straight t
  :general
  (("M-x"     . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-x C-r" . counsel-recentf))
  (:prefix "C-c f"
	   "l" 'counsel-locate
	   "z" 'counsel-fzf
	   "m" 'counsel-imenu
	   "j" 'counsel-file-jump
	   "g" 'counsel-git
	   "e" 'counsel-grep
	   "o" 'counsel-google
	   "i" 'counsel-git-grep
	   "y" 'counsel-yank-pop
	   "d" 'counsel-dired
	   "c" 'counsel-cd
	   "s" 'counsel-rg
	   "k" 'counsel-ack
	   "'" #'imenu-list-smart-toggle)
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
  :straight t
  :init
  (counsel-projectile-mode 1)
  :general
  (:keymaps 'projectile-mode-map
	    "C-c p" 'projectile-command-map))

(use-package smex
  :straight t)

(provide 'modules-counsel)
