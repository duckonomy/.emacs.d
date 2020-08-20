(use-package avy
  :ensure t
  :bind
  ("C-:" . avy-goto-char)
  ("M-g i" . avy-goto-char)
  ("M-g o" . avy-goto-char-2)
  ("M-g f" . avy-goto-line)
  ("M-g w" . avy-goto-word-1)
  ("M-g e" . avy-goto-word-0))


(provide 'modules-avy)
