(use-package auth-source-pass
  :straight t
  :after (auth-source password-store)
  :after (auth-source)
  :init
  (auth-source-pass-enable)
  (setq auth-source-do-cache nil)
  (setq auth-sources '(password-store)))

(use-package pass)

(provide 'modules-pass)
