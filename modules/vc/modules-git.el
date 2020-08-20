(use-package magit
  :ensure t)

(use-package git-gutter
  :ensure t
  :hook
  (prog-mode . git-gutter-mode))

(provide 'modules-git)
