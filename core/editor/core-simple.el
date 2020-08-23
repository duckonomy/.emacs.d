(use-package simple
  :straight (:type built-in)
  :preface
  (defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
    "Keyboard escape quit."
    (let (orig-one-window-p)
      (fset 'orig-one-window-p (symbol-function 'one-window-p))
      (fset 'one-window-p (lambda (&optional nomini all-frames) t))
      (unwind-protect
	  ad-do-it
	(fset 'one-window-p (symbol-function 'orig-one-window-p)))))
  :general
  ("M-z" 'zap-up-to-char
   [escape] 'keyboard-escape-quit)
  (:keymaps 'minibuffer-local-map
	    [escape] 'keyboard-escape-quit)
  (:keymaps 'minibuffer-local-ns-map
	    [escape] 'keyboard-escape-quit)
  (:keymaps 'minibuffer-local-completion-map
	    [escape] 'keyboard-escape-quit)
  (:keymaps 'minibuffer-local-must-match-map
	    [escape] 'keyboard-escape-quit)
  (:keymaps 'minibuffer-local-isearch-map
	    [escape] 'keyboard-escape-quit)
  :config
  (setq kill-ring-max 3000)
  (setq next-line-add-newlines nil)
  (column-number-mode +1)
  (toggle-truncate-lines 1)
  (autoload 'zap-up-to-char "misc"
    "Kill up to, but not including ARGth occurrence of CHAR." t)
  )

(provide 'core-simple)
