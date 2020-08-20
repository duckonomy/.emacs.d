(use-package smartparens
  :ensure t
  :hook
  (after-init . smartparens-global-mode)
  :config
  (require 'smartparens-config)
  (sp-pair "=" "=" :actions '(wrap))
  (sp-pair "+" "+" :actions '(wrap))
  (sp-pair "<" ">" :actions '(wrap))
  (sp-pair "$" "$" :actions '(wrap)))

;; (use-package electric-pair-mode
;;   :init
;;   (electric-pair-mode +1)
;;   (electric-quote-mode +1)

;; (use-package rainbow-delimiters
;;   :ensure t
;;   :commands
;;   rainbow-delimiters-mode
;;   :config
;;   (setq rainbow-delimiters-max-face-count 3)
;;   :hook
;;   (prog-mode . rainbow-delimiters-mode))

(provide 'modules-delimiters)
