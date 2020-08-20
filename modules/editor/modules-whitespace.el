(use-package whitespace
  :ensure nil
  :preface
  (defun clean-white ()
	"Clean white."
	(add-hook 'before-save-hook #'whitespace-cleanup nil t))

  (defun clean-trail ()
	"Clean trail."
	(add-hook 'before-save-hook #'delete-trailing-whitespace nil t))
  :hook
  ((prog-mode sgml-mode) . clean-white))


(provide 'modules-whitespace)
