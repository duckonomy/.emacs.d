;; (use-package company
;;   :straight t
;;   ;;Special Case in python to shift to the left use C-C <
;;   :bind
;;   ("TAB" . company-indent-or-complete-common)
;;   :init
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   :config
;;   (setq company-idle-delay 0)
;;   (setq company-minimum-prefix-length 1)
;;   (push 'company-files company-backends))

;; (use-package company-box
;;   :hook
;;   (company-mode . company-box-mode))

;; ;; (use-package company
;; ;;   :diminish ""
;; ;;   :preface
;; ;;   (defun company-yasnippet-or-completion ()
;; ;;	"Solve company yasnippet conflicts."
;; ;;	(interactive)
;; ;;	(let ((yas-fallnback-behavior
;; ;;	   (apply 'company-complete-common nil)))
;; ;;	  (yas-expand)))
;; ;;   ;; :hook
;; ;;   ;; (prog-mode )
;; ;;   ;; (((prog-mode comint-mode) . company-mode)
;; ;;   ;;		 (company-mode . (lambda ()
;; ;;   ;;						   (substitute-key-definition
;; ;;   ;;							'company-complete-common
;; ;;   ;;							'company-yasnippet-or-completion
;; ;;   ;;							company-active-map))))

;; ;;   :config
;; ;;   (setq company-tooltip-limit 20)
;; ;;   (setq company-idle-delay 0.0)
;; ;;   (setq company-minimum-prefix-length 1)
;; ;;   (setq company-echo-delay 0)
;; ;;   (setq company-require-match nil)
;; ;;   (setq company-selection-wrap-around t)
;; ;;   (setq company-tooltip-align-annotations t)
;; ;;   ;; weight by frequency
;; ;;   (company-transformers '(company-sort-by-occurrence))
;; ;;   :bind
;; ;;   (:map company-active-map
;; ;;	  ("M-n" . nil)
;; ;;	  ("M-p". nil)
;; ;;	  ("C-n" . company-select-next)
;; ;;	  ("C-p" . company-select-previous)
;; ;;	  ("TAB" . company-complete-common-or-cycle)
;; ;;	  ("<tab>" . company-complete-common-or-cycle)
;; ;;	  ("S-TAB" . company-select-previous)
;; ;;	  ("<backtab>" . company-select-previous)))


;; ; (use-package company-posframe
;; ;   :straight t
;; ;   :config
;; ;   (company-posframe-mode 1))

(use-package company
  :straight t
  ;; Special Case in python to shift to the left use C-C <
  :hook
  (prog-mode . company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (push 'company-files company-backends))

(use-package company-box
  :straight t
  :hook
  (company-mode . company-box-mode))

(provide 'modules-company)
