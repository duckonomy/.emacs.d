(use-package rust-mode
  :straight t
  :hook
  (rust-mode . (lambda () (setq indent-tabs-mode nil))))

;; (use-package flycheck-rust
;;   :straight t
;;   :hook
;;   (rust-mode . flycheck-rust-setup))

(provide 'modules-rust)
