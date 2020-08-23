(use-package projectile
  :straight t
  :init
  (projectile-mode +1)
  :config
  (general-define-key
   :keymaps 'projectile-mode-map
   "C-x p" 'projectile-command-map
   "C-c p" nil
   )

  (general-define-key
   :prefix "C-c p"
   "b" 'counsel-projectile-switch-to-buffer
   "d" 'counsel-projectile-find-dir
   "D" 'projectile-dired
   "f" 'counsel-projectile-find-file
   "i" 'projectile-invalidate-cache
   "k" 'projectile-kill-buffers
   "p" 'counsel-projectile-switch-project
   "r" 'projectile-replace
   "R" 'projectile-replace-regexp
   "s" 'counsel-rg
   "S" 'projectile-save-project-buffers
   )

  (general-define-key
   :keymaps 'projectile-mode-map
   :prefix "C-x p"
   "ESC" 'nil
   "TAB" 'projectile-project-buffers-other-buffer
   )

  (setq projectile-enable-caching nil)
  (setq projectile-indexing-method 'alien)
  (setq projectile-completion-system 'ivy)
  (with-eval-after-load 'projectile
    (setq projectile-project-root-files-top-down-recurring
	  (append '("compile_commands.json"
		    ".cquery")
		  projectile-project-root-files-top-down-recurring))))

(provide 'modules-projectile)
