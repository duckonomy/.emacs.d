(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :config
  (setq projectile-enable-caching nil)
  (setq projectile-indexing-method 'alien)
  (setq projectile-completion-system 'ivy)
  (with-eval-after-load 'projectile
	(setq projectile-project-root-files-top-down-recurring
	  (append '("compile_commands.json"
			".cquery")
		  projectile-project-root-files-top-down-recurring))))

(provide 'modules-projectile)
