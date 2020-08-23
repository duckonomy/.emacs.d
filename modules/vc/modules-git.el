(use-package magit
  :straight t)

(use-package forge
  :straight t
  :after magit)

(use-package git-gutter
  :straight t
  :hook
  (prog-mode . git-gutter-mode))

(provide 'modules-git)
