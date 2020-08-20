;; (use-package yasnippet
;;   :ensure t
;;   :init
;;   (yas-global-mode 1))

;; (use-package yasnippet-snippets
;;   :ensure t)

;; ;; (use-package yasnippet
;; ;;   :ensure t
;; ;;   :hook
;; ;;   (prog-mode . yas-minor-mode-on)
;; ;;   :preface
;; ;;   (defvar company-mode/enable-yas t
;; ;;	"Enable yasnippet for all backends.")
;; ;;   (defun company-mode/backend-with-yas (backend)
;; ;;	"Yasnippet backends BACKEND."
;; ;;	(if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;; ;;	backend
;; ;;	  (append (if (consp backend) backend (list backend))
;; ;;		  '(:with company-yasnippet))))
;; ;;   :requires company
;; ;;   :bind
;; ;;   (:map yas-minor-mode-map
;; ;;			  ("C-c k" . yas-expand))
;; ;;   :config
;; ;;   (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
;; ;; (defun mars/company-backend-with-yas (backends)
;; ;;	  "Add :with company-yasnippet to company BACKENDS.
;; ;; Taken from https://github.com/syl20bnr/spacemacs/pull/179."
;; ;;	  (if (and (listp backends) (memq 'company-yasnippet backends))
;; ;;	  backends
;; ;;	(append (if (consp backends)
;; ;;			backends
;; ;;		  (list backends))
;; ;;		'(:with company-yasnippet))))

;; ;;	;; add yasnippet to all backends
;; ;;	(setq company-backends
;; ;;		  (mapcar #'mars/company-backend-with-yas company-backends))

;; ;;   )

;; ;; (use-package yasnippet-snippets
;; ;;   :ensure t)

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(provide 'modules-yasnippets)
