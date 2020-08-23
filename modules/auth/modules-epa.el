(use-package epa
  :straight (:type built-in)
  :init
  (epa-file-name-regexp-update)
  :config
  (setenv "GPG_AGENT_INFO" nil)
  (setq epg-gpg-program "gpg2")
  (setq epa-file-name-regexp "\\.\\(gpg\\|asc\\)$")
  ;; (load-library "/path/to/your-secrets.el.gpg")
  )

(provide 'modules-epa)
