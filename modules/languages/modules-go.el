(use-package go-mode
  :ensure t
  :hook
  (go-mode . lsp-deferred))


(provide 'modules-go)
