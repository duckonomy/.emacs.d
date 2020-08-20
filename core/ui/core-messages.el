(use-package message
  :ensure nil
  :config
  (setq message-kill-buffer-on-exit t)
  (setq message-log-max nil)
  :init
  (kill-buffer "*Messages*"))

(provide 'core-messages)
