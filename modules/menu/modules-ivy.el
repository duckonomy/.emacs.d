(use-package ivy
  :ensure t
  :diminish (ivy-mode . "") ; does not display ivy in the modeline
  :preface
  (defun my-ivy-switch-buffer (regex-list)
	"Ivy switch Buffer REGEX-LIST."
	(let ((ivy-ignore-buffers regex-list))
	  (ivy-switch-buffer)))

  (defun my-show-only-irc-buffers ()
	"Show only irc buffers."
	(interactive)
	(my-ivy-switch-buffer '("^[^#]")))

  (defun my-also-ignore-star-buffers ()
	"Ignore everything starting with a star along with whatever ivy's defaults are."
	(interactive)
	(my-ivy-switch-buffer (append ivy-ignore-buffers `("^\*"))))

  :init
  (ivy-mode 1)        ; enable ivy globally at startup
  :config
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq ivy-height 10)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-display-style 'fancy)
  (setq ivy-wrap t)
  :bind
  (("C-x M-b" . my-also-ignore-star-buffers)
   :map ivy-minibuffer-map
   ("C-l" . counsel-up-directory)
   ("C-'" . ivy-avy)
   ("<C-m>" . ivy-done)))

(use-package ivy-posframe
  :ensure t
  :init
  (ivy-posframe-mode 1)
  :config
  (setq ivy-posframe-hide-minibuffer t)
  (setq ivy-posframe-parameters
   '((left-fringe . 10)
	 (right-fringe . 10)))
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center))))

; (use-package ivy-xref
;   :ensure t
;   :config
;   (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(provide 'modules-ivy)
