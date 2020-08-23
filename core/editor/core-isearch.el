;; (use-package isearch
;;   :bind (:map isearch-mode-map
;;	      ([escape] . isearch-abort))
;;   )

  (general-define-key
   :keymaps 'isearch-mode-map
   [escape] 'isearch-abort)

;; (general-define-key
;;   :keymaps 'normal
;;   :prefix "SPC m"
;;   :prefix-map 'markdown-mode-style-map
;;   )

(provide 'core-isearch)
