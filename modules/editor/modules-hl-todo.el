(use-package hl-todo
  :straight t
  ;; :config
  ;; (global-hl-todo-mode 1)
  :hook
  (prog-mode . hl-todo-mode))

(provide 'modules-hl-todo)
