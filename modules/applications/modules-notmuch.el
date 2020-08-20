(use-package notmuch
  :ensure t
  :config
  (setq user-full-name "Ian Park")
  (setq user-mail-address "contact@duckonomy.com")
  (setq mail-user-agent 'message-user-agent)
  (setq mail-specify-envelope-from t)
  (setq sendmail-program "/usr/bin/msmtp"
					mail-specify-envelope-from t
					mail-envelope-from 'header
					message-sendmail-envelope-from 'header))

(use-package counsel-notmuch
  :ensure t)

(provide 'modules-notmuch)
