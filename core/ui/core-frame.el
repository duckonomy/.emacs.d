(use-package frame
  :ensure nil
  :bind
  ("C-z" . nil)
  :config
  (setq frame-title-format
   '(buffer-file-name "%f"
					  (dired-directory dired-directory "%b")))
  (setq window-divider-default-places t)
  (setq window-divider-default-bottom-width 0)
  (setq window-divider-default-right-width 1)
  ;; (global-tab-line-mode 1)
  ;; (tab-bar-mode 1)


  (setq tab-bar-close-button-show nil)
  ;; (setq tab-bar-mode t)
  (setq tab-bar-new-button-show nil)
  (setq tab-bar-position nil)
  (setq tab-line-close-button-show nil)
  (setq tab-line-new-button-show nil)

  (set-frame-parameter (selected-frame) 'internal-border-width 40)
  (add-to-list 'default-frame-alist '(internal-border-width . 40))
  )

(provide 'core-frame)
