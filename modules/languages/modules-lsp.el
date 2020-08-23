;; (use-package lsp-mode
;;   :straight t
;;   :commands
;;   lsp
;;   :hook
;;   (scala-mode . lsp)
;;   (sh-mode . lsp)
;;   (cmake-mode . lsp)
;;   (LaTeX-mode . lsp)
;;   (yaml-mode . lsp)
;;   :init
;;   (setq lsp-diagnostic-package :flycheck)
;;   (setq lsp-enable-indentation nil)
;;   (setq lsp-enable-on-type-formatting nil)
;;   (setq lsp-enable-snippet t)
;;   (setq lsp-report-if-no-buffer t)
;;   (setq lsp-signature-auto-activate t)
;;   (setq read-process-output-max (* 1024 1024 3))
;;   (with-eval-after-load 'lsp-mode
;;	(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)))


;; (use-package lsp-ui
;;   :commands
;;   lsp-ui-mode
;;   :straight t
;;   :bind
;;   (:map lsp-ui-mode-map
;;	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;;	([remap xref-find-references] . lsp-ui-peek-find-references))
;;   :init
;;   (setq lsp-ui-sideline-enable t
;;	lsp-ui-doc-use-webkit t
;;		lsp-ui-doc-enable t
;;	lsp-prefer-flymake :none
;;		lsp-ui-imenu-enable t))

;; (with-eval-after-load 'lsp-ui-mode
;;   (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1))))
;; ;; (use-package lsp-mode
;; ;;   :hook
;; ;;   (prog-mode . lsp)
;; ;;   :commands
;; ;;   lsp
;; ;;   :config
;; ;;   (setq lsp-prefer-capf t)
;; ;;   (setq lsp-idle-delay 0.500)
;; ;;   (setq lsp-completion-provider :capf)
;; ;;   (setq lsp-enable-file-watchers nil))

;; ;; (use-package lsp-ivy
;; ;;   :straight t
;; ;;   :commands
;; ;;   lsp-ivy-workspace-symbol)

;; ;; (use-package lsp-treemacs
;; ;;   :straight t
;; ;;   :commands
;; ;;   lsp-treemacs-errors-list)

;; ;; (use-package dap-mode
;; ;;   :straight t)

;; ;; optionally
;; ;; (use-package lsp-ui
;; ;; :straight t
;; ;; :commands
;; ;; lsp-ui-mode)
;; ;; (use-package helm-lsp
;; ;; :commands
;; ;; helm-lsp-workspace-symbol)

;; ;; (use-package lsp-treemacs
;; ;;   :straight t
;; ;;   :commands
;; ;;   lsp-treemacs-errors-list) ;; on --

;; ;; optionally if you want to use debugger


;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; ;; Old LSP
;; ; (use-package lsp-mode
;; ;   ;; :commands
;; ;   ;; lsp
;; ;   :straight t
;; ;   :hook
;; ;   ((prog-major-mode . lsp-prog-major-mode-enable)
;; ;     (lsp-after-open-hook . lsp-enable-imenu)
;; ;     (prog-mode . lsp))
;; ;   :config
;; ;   (setq lsp-inhibit-message nil)
;; ;   (setq lsp-eldoc-render-all nil)
;; ;   (setq lsp-highlight-symbol-at-point nil)
;; ;   (setq lsp-enable-file-watchers nil)
;; ;   (setq lsp-prefer-capf t)
;; ;   (setq lsp-idle-delay 0.500)
;; ;   (setq lsp-clients-angular-language-server-command
;; ;    '("node"
;; ;      "/usr/lib/node_modules/@angular/language-server"
;; ;      "--ngProbeLocations"
;; ;      "/usr/lib/node_modules"
;; ;      "--tsProbeLocations"
;; ;      "/usr/lib/node_modules"
;; ;      "--stdio")))

;; ; (use-package lsp-ui
;; ;   ;; :commands
;; ;   ;; lsp-ui-mode
;; ;   :straight t
;; ;   :hook
;; ;   (lsp-mode . lsp-ui-mode)
;; ;   :config
;; ;   (lsp-ui-sideline-enable t)
;; ;   (lsp-ui-sideline-show-symbol t)
;; ;   (lsp-ui-sideline-show-hover t)
;; ;   (lsp-ui-sideline-show-code-actions t)
;; ;   (lsp-ui-sideline-update-mode 'point))

;; ;; (use-package eglot
;; ;;   :straight t
;; ;;   :config
;; ;;   (add-hook 'prog-mode-hook 'eglot-straight))

;; ;; Deprecated
;; ; (use-package company-lsp
;; ;   :commands
;; ;   company-lsp
;; ;   :straight t
;; ;   :config
;; ;   (setq company-lsp-enable-recompletion t)
;; ;   (setq company-transformers nil)
;; ;   (setq company-lsp-async t)
;; ;   (setq company-lsp-cache-candidates nil)
;; ;   (add-to-list 'company-backends
;; ;                'company-lsp))

(use-package lsp-mode
  :straight t
  :commands
  lsp
  :hook
  (scala-mode . lsp)
  (sh-mode . lsp)
  (cmake-mode . lsp)
  (LaTeX-mode . lsp)
  (yaml-mode . lsp)
  :init
  (setq-default lsp-diagnostics-provider :flycheck)
  (setq lsp-enable-indentation nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-snippet t)
  (setq-default lsp-report-if-no-buffer t)
  (setq lsp-signature-auto-activate t)
  (setq read-process-output-max (* 1024 1024 3))
  (with-eval-after-load 'lsp-mode
	(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)))

;; (use-package lsp-ui
;;   :commands
;;   lsp-ui-mode
;;   :straight t
;;   :bind
;;   (:map lsp-ui-mode-map
;;	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;;	([remap xref-find-references] . lsp-ui-peek-find-references))
;;   :init
;;   (setq lsp-ui-sideline-enable t
;;	lsp-ui-doc-use-webkit t
;;		lsp-ui-doc-enable t
;;		lsp-prefer-flymake :none
;;		lsp-ui-imenu-enable t))

;; (with-eval-after-load 'lsp-ui-mode
;;   (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1))))

(provide 'modules-lsp)
