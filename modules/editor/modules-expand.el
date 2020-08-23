(use-package expand-region
  :straight t
  :bind
  ("C-\\" . er/expand-region)
  ("C-|" . er/contract-region))

(use-package  hippie-expand
  :bind
  ("C-M-|" . hippie-expand))

(provide 'modules-expand)
