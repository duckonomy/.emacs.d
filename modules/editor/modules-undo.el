;; (use-package undo-tree
;;   :straight t
;;   :diminish undo-tree-mode
;;   :config
;;   (global-undo-tree-mode 1)
;;   (progn
;;	(defalias 'redo 'undo-tree-redo)
;;	(defalias 'undo 'undo-tree-undo))
;;   :general
;;   ("C-/" . undo
;;    "C-S-/" . redo
;;    "C-?" . redo
;;    "C-z" . undo
;;    "C-S-z" . redo
;;    "C-x u" . undo))

(use-package undo-fu
  :straight t
  :general
  ("C-/" 'undo-fu-only-undo
   "C-S-/" 'undo-fu-only-redo
   "C-?" 'undo-fu-only-redo)
  (:keymaps '(normal)
	    "u" 'undo-fu-only-undo
	    "\C-r" 'undo-fu-only-redo)
  :config
  (global-undo-tree-mode -1)
  (setq undo-limit 400000
		undo-strong-limit 3000000
		undo-outer-limit 3000000))


(provide 'modules-undo)
