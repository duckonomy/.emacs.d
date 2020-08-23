(use-package minibuffer
  :config
  (setq read-file-name-completion-ignore-case t)
  (setq read-buffer-completion-ignore-case t)
  (setq enable-recursive-minibuffers nil)
  (mapc (lambda (x)
	  (add-to-list 'completion-ignored-extensions x))
	'(".aux" ".bbl" ".blg" ".exe"
	  ".log" ".meta" ".out" ".pdf"
	  ".synctex.gz" ".tdo" ".toc"
	  "-pkg.el" "-autoloads.el"
	  "Notes.bib" "auto/"
	  ".o" ".elc" "~" ".bin"
	  ".class" ".exe" ".ps"
	  ".abs" ".mx" ".~jv" ".rbc"
	  ".pyc" ".beam" ".aux" ".out"
	  ".pdf" ".hbc"))
  )

(provide 'core-minibuffer)
