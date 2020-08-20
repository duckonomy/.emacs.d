;; (use-package undo-tree
;;   :ensure t
;;   :diminish undo-tree-mode
;;   :config
;;   (global-undo-tree-mode 1)
;;   (progn
;;	(defalias 'redo 'undo-tree-redo)
;;	(defalias 'undo 'undo-tree-undo))
;;   :bind
;;   (("C-/" . undo)
;;    ("C-S-/" . redo)
;;    ("C-?" . redo)
;;    ("C-z" . undo)
;;    ("C-S-z" . redo)
;;    ("C-x u" . undo)))

(use-package undo-fu
  :ensure t
  :bind
  (("C-/" . undo-fu-only-undo)
   ("C-S-/" . undo-fu-only-redo)
   ("C-?" . undo-fu-only-redo))
  :init
  (global-undo-tree-mode -1)
  :config
  (global-undo-tree-mode -1)
  (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
  (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)
  (setq undo-limit 400000
		undo-strong-limit 3000000
		undo-outer-limit 3000000))


(provide 'modules-undo)
