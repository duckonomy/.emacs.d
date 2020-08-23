(use-package files
  :config
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq-default cache-long-line-scans t)
  ;; (setq backup-directory-alist `(("." . "~/.saves")))
  (setq backup-directory-alist
	`((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
	`((".*" ,temporary-file-directory t)))
  (setq backup-by-copying t)
  (setq create-lockfiles nil)
  (setq delete-old-versions t)
  (setq kept-new-versions 6)
  (setq kept-old-versions 2)
  (setq auto-save-list-file-prefix nil)
  (setq-default org-clock-persist-file "~/.config/emacs/org-clock-save.el")
  (setq-default smex-save-file "~/.config/emacs/smex-items")
  (setq version-control t)
  )

(provide 'core-files)
