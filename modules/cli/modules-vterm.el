(use-package vterm
  :straight t
  ;; UNSAFE
  :bind
  (:map vterm-mode-map
	("M-o" . ace-window)
	;;   (bind-key "<C-iso-lefttab>" 'centaur-tabs-backward)
	)
  :config
  (add-hook 'vterm-exit-functions #'(lambda (buf &optional event)
				      (kill-buffer buf)
				      (ignore-errors (delete-window))
				      (message "VTerm closed.")))
  (setq vterm-kill-buffer-on-exit t)
  )

(use-package multi-vterm
  :straight t
  :config
  :bind
  (:map vterm-mode-map
	("M-o" . ace-window)
	;; ("C-c t n" . multi-vterm)
	("<C-return>" . multi-vterm)
	("<C-tab>" . multi-vterm-next)
	("<C-backspace>" . (lambda () (interactive) (vterm-send-key (kbd "C-w"))))
	("<C-iso-lefttab>" . multi-vterm-prev)))

(use-package vterm-toggle
  :straight t
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
	       '((lambda(bufname _) (with-current-buffer bufname (equal major-mode 'vterm-mode)))
		 (display-buffer-reuse-window display-buffer-at-bottom)
		 ;;(display-buffer-reuse-window display-buffer-in-direction)
		 ;;display-buffer-in-direction/direction/dedicated is added in emacs27
		 ;;(direction . bottom)
		 ;;(dedicated . t) ;dedicated is supported in emacs27
		 (reusable-frames . visible)
		 (window-height . 0.35)))
  )

(provide 'modules-vterm)
