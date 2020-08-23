; Does not work... have to manually enable this inside html script tag
(use-package js-mode
  :straight t
  :hook
  ((js-mode . lsp)))

; Just use as minor-mode.
(use-package js2-mode
  :straight t
  :config
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-missing-semi-one-line-override t)
  :hook
  ((js-mode . js2-minor-mode)))

(use-package prettier-js
  :straight t
  :hook
  ((js-mode web-mode) . prettier-js-mode)
  :config
  (setq prettier-js-args '("--trailing-comma" "all"
			   "--tab-width" "2"
			   "--parser" "flow"
			   "--semi" "true"
			   "--single-quote" "true"
			   )))

;; (use-package tide
;;   :straight t
;;   :preface
;;   (defun setup-tide-mode ()
;;     "Tide-mode setup."
;;     (interactive)
;;     (tide-setup)
;;     (lsp-mode nil)
;;     (lsp-mode -1)
;;     (flycheck-mode +1)
;;     (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;     (eldoc-mode +1)
;;     (tide-hl-identifier-mode +1)
;;     (company-mode +1))
;;   :hook
;;   ((typescript-mode . setup-tide-mode)
;;    (js-mode . setup-tide-mode)
;;    (vue-mode . setup-tide-mode)
;;    (vue-html-mode . setup-tide-mode)
;;    (before-save-hook . tide-format-before-save))
;;   :config
;;   (setq company-tooltip-align-annotations t))

(use-package vue-mode
  :straight t)

(use-package vue-html-mode
  :straight t)

(use-package eslint-fix
  :straight t
  :init
  (eval-after-load 'js-mode
    '(add-hook 'js-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t)))))

(provide 'modules-js)
