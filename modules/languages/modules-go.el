(use-package go-mode
  :straight t
  :hook
  (go-mode . lsp-deferred))


(provide 'modules-go)
