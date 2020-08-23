(use-package paren
  :straight (:type built-in)
  :init
  (show-paren-mode 1)
  :custom
  (show-paren-highlight-openparen t)
  (show-paren-when-point-inside-paren t)
  (show-paren-delay 0))

(provide 'core-parens)
