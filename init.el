;;; init.el --- Emacs init file
;; Author: Ian Park
;;; Commentary:
;;; My Emacs config.
;;; Code:

(defvar duckonomy/file-name-handler-alist file-name-handler-alist)

(setq file-name-handler-alist nil
	  gc-cons-threshold most-positive-fixnum
	  gc-cons-percentage 0.6
	  site-run-file nil
	  read-process-ouput-max (* 1024 1024)
	  ad-redefinition-action 'accept)

(defvar duckonomy/gc-cons-threshold (* 20 1024 1024))

(add-hook 'emacs-startup-hook
	  (lambda ()
		(setq gc-cons-threshold duckonomy/gc-cons-threshold
		  gc-cons-percentage 0.1
		  file-name-handler-alist duckonomy/file-name-handler-alist
		  ad-redefinition-action 'warn)))

(add-hook 'minibuffer-setup-hook (lambda ()
				   (setq gc-cons-threshold (* duckonomy/gc-cons-threshold 6))))
(add-hook 'minibuffer-exit-hook (lambda ()
				  (garbage-collect)
				  (setq gc-cons-threshold duckonomy/gc-cons-threshold)))

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org"   . "http://orgmode.org/elpa/"))

(setq package-enable-at-startup nil)
(setq package-pinned-packages '((use-package . "melpa")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure nil))

(require 'use-package)

(use-package paren
  :ensure nil
  :custom
  (show-paren-mode t)
  (show-paren-delay 0)
  (show-paren-highlight-openparen t)
  (show-paren-when-point-inside-paren t))

(use-package flycheck-pos-tip
  :ensure t
  :config
  (flycheck-pos-tip-mode t)
  (setq-default pos-tip-background-color "#ffffff")
  (setq-default pos-tip-foreground-color "#333333"))

;;Syntax checking for different languages
(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (with-eval-after-load 'flycheck
	(flycheck-pos-tip-mode))
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  ;;Raises the limit of flycheck errors that can be displayed in a single buffer, useful when using clang-analyzer.
  (setq flycheck-checker-error-threshold 5000)
  (progn
	(define-fringe-bitmap 'my-flycheck-fringe-indicator
	  (vector #b00000000
			  #b00000000
			  #b00000000
			  #b00000000
			  #b00000000
			  #b00000000
			  #b00000000
			  #b00011100
			  #b00111110
			  #b00111110
			  #b00111110
			  #b00011100
			  #b00000000
			  #b00000000
			  #b00000000
			  #b00000000
			  #b00000000))

	(flycheck-define-error-level 'error
	  :severity 2
	  :overlay-category 'flycheck-error-overlay
	  :fringe-bitmap 'my-flycheck-fringe-indicator
	  :fringe-face 'flycheck-fringe-error)

	(flycheck-define-error-level 'warning
	  :severity 1
	  :overlay-category 'flycheck-warning-overlay
	  :fringe-bitmap 'my-flycheck-fringe-indicator
	  :fringe-face 'flycheck-fringe-warning)

	(flycheck-define-error-level 'info
	  :severity 0
	  :overlay-category 'flycheck-info-overlay
	  :fringe-bitmap 'my-flycheck-fringe-indicator
	  :fringe-face 'flycheck-fringe-info)))


(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package company
  :ensure t
  ;;Special Case in python to shift to the left use C-C <
  ;; :bind ("TAB" . company-indent-or-complete-common)
  :bind (:map company-active-map
		  ("M-n" . nil)
		  ("M-p". nil)
		  ("C-n" . company-select-next)
		  ("C-p" . company-select-previous)
		  ("TAB" . company-complete-common-or-cycle)
		  ("<tab>" . company-complete-common-or-cycle)
		  ("S-TAB" . company-select-previous)
		  ("<backtab>" . company-select-previous))
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (push 'company-files company-backends))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package lsp-mode
  :ensure t
  :commands lsp
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

(use-package lsp-ui
  :commands lsp-ui-mode
  :ensure t
  :bind
  (:map lsp-ui-mode-map
	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
	([remap xref-find-references] . lsp-ui-peek-find-references))
  :init
  (setq lsp-ui-sideline-enable t
	lsp-ui-doc-use-webkit t
		lsp-ui-doc-enable t
		lsp-prefer-flymake :none
		lsp-ui-imenu-enable t))

(with-eval-after-load 'lsp-ui-mode
  (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1))))

(use-package ccls
  :ensure t
  :defer t
  :hook ((c-mode c++-mode objc-mode) .
		 (lambda () (require 'ccls) (lsp)))
  :commands (lsp-ccls-enable)
  :init
  (setq ccls-executable  "/bin/ccls")
  (setq ccls-initialization-options '(:index (:comments 2)
						 :index (:reparseForDependency 1)
						 :completion (:detailedLabel t))))


;; (with-eval-after-load 'lsp-mode
;;   (flycheck-add-next-checker 'c/c++-clang))


(defvar core-dir
  (expand-file-name "core" user-emacs-directory))

(defvar modules-dir
  (expand-file-name "modules" user-emacs-directory))

(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)

(require 'core)
(require 'modules)

(provide 'init)
