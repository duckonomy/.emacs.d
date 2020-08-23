(use-package expand-region
  :straight t
  :general
  ("C-\\" 'er/expand-region)
  ("C-|" 'er/contract-region))

(use-package  hippie-expand
  :straight (:type built-in)
  :general
  ("C-M-|" 'hippie-expand))

(provide 'modules-expand)
