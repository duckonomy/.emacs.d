(use-package shell
  :preface
  (defvar my-shebang-patterns
	(list "^#!/usr/.*/perl\\(\\( \\)\\|\\( .+ \\)\\)-w *.*"
		  "^#!/usr/.*/sh"
		  "^#!/usr/.*/bash"
		  "^#!/bin/sh"
		  "^#!/bin/bash"))
  :hook
  (after-save . (lambda ()
				  (if (not (= (shell-command (concat "test -x " (buffer-file-name))) 0))
					  (progn
						;; This puts message in *Message* twice, but minibuffer
						;; output looks better.
						(message (concat "Wrote " (buffer-file-name)))
						(save-excursion
						  (goto-char (point-min))
						  ;; Always checks every pattern even after
						  ;; match.  Inefficient but easy.
						  (dolist (my-shebang-pat my-shebang-patterns)
							(if (looking-at my-shebang-pat)
								(if (= (shell-command
										(concat "chmod u+x " (buffer-file-name)))
									   0)
									(message (concat
											  "Wrote and made executable"
											  (buffer-file-name))))))))
					;; This puts message in *Message* twice, but minibuffer output
					;; looks better.
					(message (concat "Wrote " (buffer-file-name)))))))

(provide 'core-shell)
