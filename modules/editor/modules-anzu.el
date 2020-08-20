(use-package anzu
  :ensure t
  :diminish anzu-mode
  :init
  (global-anzu-mode +1)
  :config
  (setq anzu-cons-mode-line-p nil)
  :bind
  (([remap query-replace-regexp] . anzu-query-replace-regexp)
   ([remap query-replace] . anzu-query-replace)
   :map isearch-mode-map
   ([remap isearch-query-replace] . anzu-isearch-query-replace)
   ([remap isearch-query-replace]. anzu-isearch-query-replace-regexp)))

(provide 'modules-anzu)
