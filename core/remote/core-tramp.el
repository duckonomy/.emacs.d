(use-package tramp
  :straight t
  :preface
  (defun sudo-edit (&optional arg)
	"Edit currently visited file as ARG root.

  With a prefix ARG prompt for a file to visit.
  Will also prompt for a file to visit if current
  buffer is not visiting a file."
	(interactive "P")
	(if (or arg (not buffer-file-name))
		(counsel-find-file (concat "/sudo:root@localhost:"
								   (read-file-name "Find file(as root): ")))
	  (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
  :config
  (customize-set-variable 'tramp-default-method "ssh")
  :general
  ("C-x C-a C-f" 'sudo-edit))

(provide 'core-tramp)
