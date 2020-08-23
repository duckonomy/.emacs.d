(use-package whitespace
  :preface
  (defun clean-white ()
    "Clean white."
    (add-hook 'before-save-hook #'whitespace-cleanup nil t))

  (defun clean-trail ()
    "Clean trail."
    (add-hook 'before-save-hook #'delete-trailing-whitespace nil t))

  ;; (add-hook 'prog-mode-hook (clean-white))
  ;; (add-hook 'sgml-mode-hook (clean-white))
  :hook
  ((prog-mode sgml-mode) . clean-white))

(provide 'modules-whitespace)
