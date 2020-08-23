(use-package multiple-cursors
  :straight t
  :bind
  (("C-S-c C-S-c" . mc/edit-lines )
   ("C->" . mc/mark-next-like-this )
   ("C-<" . mc/mark-previous-like-this )
   ("C-M-<" . mc/mark-all-like-this )))


(provide 'modules-multi-cursor)
