(use-package bookmark
  :straight (:type built-in)
  :config
  (setq bookmark-default-file "~/.config/emacs/bookmarks")
  (setq bookmark-save-flag 1))

(provide 'modules-bookmarks)
