(use-package epa
  :config
  (setenv "GPG_AGENT_INFO" nil)
  (setq epg-gpg-program "gpg2")
  ;; (load-library "/path/to/your-secrets.el.gpg")
  )

(provide 'modules-epa)
