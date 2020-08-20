(use-package rust-mode
  :ensure t
  :hook
  (rust-mode . (lambda () (setq indent-tabs-mode nil))))

;; (use-package flycheck-rust
;;   :ensure t
;;   :hook
;;   (rust-mode . flycheck-rust-setup))

(provide 'modules-rust)
