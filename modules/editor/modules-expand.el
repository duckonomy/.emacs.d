(use-package expand-region
  :ensure t
  :bind
  ("C-\\" . er/expand-region)
  ("C-|" . er/contract-region))

(use-package  hippie-exp
  :ensure nil
  :bind
  ("C-M-|" . hippie-expand))

(provide 'modules-expand)
