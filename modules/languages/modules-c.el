;; (use-package ccls
;;   :straight t
;;   :hook
;;   ((c-mode c++-mode objc-mode) .
;;    (lambda () (require 'ccls) (lsp)))
;;   :commands
;;   (lsp-ccls-enable)
;;   :init
;;   (setq ccls-executable  "/bin/ccls")
;;   (setq ccls-initialization-options '(:index (:comments 2)
;;											 :index (:reparseForDependency 1)
;;											 :completion (:detailedLabel t))))

;; ;; (use-package ccls
;; ;;   :config
;; ;;   (setq cquery-executable "/usr/bin/ccls")
;; ;;   :hook
;; ;;   ((c-mode c++-mode objc-mode cuda-mode) .
;; ;;	 (lambda () (require 'ccls) (lsp))))

;; ;; (use-package find-file
;; ;;   :straight nil
;; ;;   ;; UNSAFE (And don't know what this does)
;; ;;   ;; (bind-key* "C-M-o" 'ff-find-other-file)
;; ;;   ;; UNSAFE (And don't know what this does)
;; ;;   :bind
;; ;;   ("C-c o" . ff-find-other-file))

;; ;; ; (use-package modern-cpp-font-lock
;; ;; ;   :straight t
;; ;; ;   :init
;; ;; ;   (modern-c++-font-lock-global-mode t))

;; ;; ; (use-package font-lock
;; ;; ;   :straight nil
;; ;; ;   :config
;; ;; ;   (font-lock-add-keywords 'c-mode
;; ;; ;                           '(("\\(\\w+\\)\\s-*\("
;; ;; ;                              (1 rumpsteak-font-lock-function-call-face)))
;; ;; ;                           t))

(use-package ccls
  :straight t
  :hook
  ((c-mode c++-mode objc-mode) .
   (lambda () (require 'ccls) (lsp)))
  :commands
  (lsp-ccls-enable)
  :init
  (setq ccls-executable  "/bin/ccls")
  (setq ccls-initialization-options '(:index (:comments 2)
						 :index (:reparseForDependency 1)
						 :completion (:detailedLabel t))))

(provide 'modules-c)
