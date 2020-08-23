;; (use-package flycheck-pos-tip
;;   :straight t
;;   :config
;;   (flycheck-pos-tip-mode t)
;;   (setq-default pos-tip-background-color "#ffffff")
;;   (setq-default pos-tip-foreground-color "#333333"))

;; ;;Syntax checking for different languages
;; (use-package flycheck
;;   :straight t
;;   :bind
;;   (:map flycheck-mode-map
;;		  ("M-n" . flycheck-next-error)
;;		  ("M-p". flycheck-prev-error))
;;   :init
;;   (add-hook 'after-init-hook #'global-flycheck-mode)
;;   (with-eval-after-load 'flycheck
;;	(flycheck-pos-tip-mode))
;;   (setq flycheck-check-syntax-automatically '(mode-enabled save))
;;   ;;Raises the limit of flycheck errors that can be displayed in a single buffer, useful when using clang-analyzer.
;;   (setq flycheck-checker-error-threshold 5000)
;;   (progn
;;	(define-fringe-bitmap 'my-flycheck-fringe-indicator
;;	  (vector #b00000000
;;			  #b00000000
;;			  #b00000000
;;			  #b00000000
;;			  #b00000000
;;			  #b00000000
;;			  #b00000000
;;			  #b00011100
;;			  #b00111110
;;			  #b00111110
;;			  #b00111110
;;			  #b00011100
;;			  #b00000000
;;			  #b00000000
;;			  #b00000000
;;			  #b00000000
;;			  #b00000000))

;;	(flycheck-define-error-level 'error
;;	  :severity 2
;;	  :overlay-category 'flycheck-error-overlay
;;	  :fringe-bitmap 'my-flycheck-fringe-indicator
;;	  :fringe-face 'flycheck-fringe-error)

;;	(flycheck-define-error-level 'warning
;;	  :severity 1
;;	  :overlay-category 'flycheck-warning-overlay
;;	  :fringe-bitmap 'my-flycheck-fringe-indicator
;;	  :fringe-face 'flycheck-fringe-warning)

;;	(flycheck-define-error-level 'info
;;	  :severity 0
;;	  :overlay-category 'flycheck-info-overlay
;;	  :fringe-bitmap 'my-flycheck-fringe-indicator
;;	  :fringe-face 'flycheck-fringe-info)))


;; ;; (use-package flycheck
;; ;;   :straight t
;; ;;   :diminish ""
;; ;;   :commands
;; ;;   (global-flycheck-mode)
;; ;;   :init
;; ;;   (add-hook 'after-init-hook #'global-flycheck-mode)
;; ;;   :config
;; ;;   (setq flycheck-check-syntax-automatically '(mode-enabled save))
;; ;;   (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc)))


;; ;; (use-package flycheck-pos-tip
;; ;;   :straight t
;; ;;   :init
;; ;;   (with-eval-after-load 'flycheck
;; ;;	(flycheck-pos-tip-mode)))


;;; (use-package flycheck-inline
;;;   :straight t
;;;   :init
;;;   (with-eval-after-load 'flycheck
;;;     (global-flycheck-inline-mode)))

(use-package flycheck-pos-tip
  :straight t
  :config
  (flycheck-pos-tip-mode t))

;;Syntax checking for different languages
(use-package flycheck
  :straight t
  :hook (prog-mode . flycheck-mode)
  :config
  (defhydra hydra-flycheck (:color "#1098F7")
    "Flycheck"
    ("m" flycheck-compile "Compile")
    ("w" flycheck-copy-errors-as-kill "Copy Error as Kill")
    ("?" flycheck-describe-checker "Describe Checker")
    ("c" flycheck-buffer "Buffer")
    ("C" flycheck-clear "Clear")
    ("v" flycheck-verify-setup "Verify Setup")
    ("V" flycheck-version "Version")
    ("h" flycheck-display-error-at-point "Display Error")
    ("H" display-local-help "Help")
    ("e" flycheck-explain-error-at-point "Explain Error")
    ("i" flycheck-manual "Manual")
    ("l" flycheck-list-errors "List Errors")
    ("n" flycheck-next-error "Next Error")
    ("p" flycheck-previous-error "Previous Error")
    ("s" flycheck-select-checker "Select Checker")
    ("x" flycheck-disable-checker "Disable Checker"))

  (general-define-key
   :keymaps 'flycheck-mode-map
   "C-c !" 'hydra-flycheck/body)

  :bind
  (:map flycheck-mode-map
		("M-n" . flycheck-next-error)
		("M-p". flycheck-previous-error))
  :init
  ;; (add-hook 'after-init-hook #'global-flycheck-mode)
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

(provide 'modules-flycheck)
