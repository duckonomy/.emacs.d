;; (use-package stripe-buffer
;;   :straight t
;;   :commands
;;   stripe-buffer-mode
;;   :hook
;;   (dired-mode . stripe-buffer-mode))

(use-package bufler
  :straight t
  :config
  (bufler-mode))

(provide 'modules-buffer)
