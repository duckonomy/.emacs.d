;; (use-package stripe-buffer
;;   :ensure t
;;   :commands
;;   stripe-buffer-mode
;;   :hook
;;   (dired-mode . stripe-buffer-mode))

(use-package bufler
  :ensure t
  :config
  (bufler-mode))

(provide 'modules-buffer)
