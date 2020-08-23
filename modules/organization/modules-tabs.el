;; (use-package centaur-tabs
;;   :straight t
;;   ;; :load-path
;;   ;; "~/.config/emacs/tabs"
;;   :config
;;   (setq centaur-tabs-style "bar"
;;		centaur-tabs-height 50
;;		centaur-tabs-set-icons nil
;;		centaur-tabs-set-modified-marker nil
;;		centaur-tabs-show-navigation-buttons nil)
;;   (centaur-tabs-headline-match)

;;   (setq centaur-tabs-gray-out-icons 'buffer)
;;   (setq centaur-tabs-cycle-scope 'tabs)
;;   (centaur-tabs-enable-buffer-reordering)
;;   (setq centaur-tabs-adjust-buffer-order t)

;;   (centaur-tabs-mode t)

;;   (setq uniquify-separator "/")
;;   (setq uniquify-buffer-name-style 'forward)
;;   (defun centaur-tabs-buffer-groups ()
;;	(list
;;	 (cond
;;	  ((memq major-mode '(eshell-mode
;;						  shell-mode
;;						  vterm-mode
;;						  term-mode))
;;	   "Eshell")
;;	  ((or (string-equal "*" (substring (buffer-name) 0 1))
;;		   (memq major-mode '(magit-process-mode
;;							  magit-status-mode
;;							  magit-diff-mode
;;							  magit-log-mode
;;							  magit-file-mode
;;							  magit-blob-mode
;;							  magit-blame-mode
;;							  )))
;;	   "Emacs")
;;	  ((derived-mode-p 'prog-mode)
;;	   "Editing")
;;	  ((derived-mode-p 'dired-mode)
;;	   "Dired")
;;	  ((memq major-mode '(helpful-mode
;;						  help-mode))
;;	   "Help")
;;	  ((memq major-mode '(org-mode
;;						  org-agenda-clockreport-mode
;;						  org-src-mode
;;						  org-agenda-mode
;;						  org-beamer-mode
;;						  org-indent-mode
;;						  org-adapt-indentation
;;						  org-odd-levels-only
;;						  org-bullets-mode
;;						  org-cdlatex-mode
;;						  org-agenda-log-mode
;;						  diary-mode))
;;	   "OrgMode")
;;	  (t
;;	   (centaur-tabs-get-group-name (current-buffer))))))

;;   ;; Hack for now
;;   (bind-key "<C-tab>" 'centaur-tabs-forward)
;;   (bind-key "<C-iso-lefttab>" 'centaur-tabs-backward)
;;   (bind-key "C-c t s" 'centaur-tabs-counsel-switch-group)
;;   (bind-key "C-c t p" 'centaur-tabs-group-by-projectile-project)
;;   (bind-key "C-c t g" 'centaur-tabs-group-buffer-groups)
;;   ;; Hack for now
;;   (add-hook 'dashboard-mode-hook 'centaur-tabs-local-mode)
;;   (add-hook 'calendar-mode-hook 'centaur-tabs-local-mode)
;;   (add-hook 'org-agenda-mode-hook 'centaur-tabs-local-mode)
;;   (add-hook 'helpful-mode-hook 'centaur-tabs-local-mode)
;;   (add-hook 'prog-mode-hook 'centaur-tabs-local-mode)
;;   (add-hook 'sgml-mode-hook 'centaur-tabs-local-mode)
;;   (add-hook 'text-mode-hook 'centaur-tabs-local-mode)
;;   (add-hook 'org-mode-hook 'centaur-tabs-local-mode)
  ;; )


(provide 'modules-tabs)
