(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-tools-install)
  :defer t
  :preface
  (defun my/scroll-other-window ()
	"Scroll other window up."
	(interactive)
	(let* ((wind (other-window-for-scrolling))
	   (mode (with-selected-window wind major-mode)))
	  (if (eq mode 'pdf-view-mode)
	  (with-selected-window wind
		(pdf-view-next-line-or-next-page 2))
	(scroll-other-window 2))))

  (defun my/scroll-other-window-down ()
	"Scroll other window down."
	(interactive)
	(let* ((wind (other-window-for-scrolling))
	   (mode (with-selected-window wind major-mode)))
	  (if (eq mode 'pdf-view-mode)
	  (with-selected-window wind
		(progn
		  (pdf-view-previous-line-or-previous-page 2)
		  (other-window 1)))
	(scroll-other-window-down 2))))
  :bind
  ("C-M-S-v" . my/scroll-other-window-down)
  ("C-M-v" . my/scroll-other-window)
  ("C-x C-g" . pdf-sync-forward-search)
  :config
  (setq mouse-wheel-follow-mouse t)
  (setq pdf-view-resize-factor 1.10)
  (pdf-tools-install))

(provide 'modules-pdf-tools)
