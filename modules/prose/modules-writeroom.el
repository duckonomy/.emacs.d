(use-package writeroom-mode
  :straight t
  :config
  (with-eval-after-load 'writeroom-mode
    (define-key writeroom-mode-map (kbd "C-M-<") #'writeroom-decrease-width)
    (define-key writeroom-mode-map (kbd "C-M->") #'writeroom-increase-width)
    (define-key writeroom-mode-map (kbd "C-M-=") #'writeroom-adjust-width)))

(provide 'modules-writeroom)
