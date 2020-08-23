;; (use-package epa-hook
;;   :config
(setq epa-file-name-regexp "\\.\\(gpg\\|asc\\)$")
  ;; :init
(epa-file-name-regexp-update)
;; )

(provide 'core-epa-file)
