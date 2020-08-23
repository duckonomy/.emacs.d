(use-package recentf
  :straight (:type built-in)
  :init
  (recentf-mode)
  :config
  (setq recentf-max-saved-items 200
	recentf-auto-cleanup 300
	recentf-exclude (list "/\\.git/.*\\'" ; Git contents
			      "/elpa/.*\\'"   ; Package files
			      ".*\\.gz\\'"
			      "TAGS"
			      ".*-autoloads\\.el\\'"
			      "ido.last")))

(provide 'core-recentf)
