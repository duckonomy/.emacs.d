(use-package editing
  :straight (:type built-in)
  :preface
  (defun backward-kill-line (arg)
    "Kill ARG lines backward."
    (interactive "p")
    (kill-line (- 1 arg)))

  (defun duckonomy/keys-decode (&optional frame)
    "Decode archaic ASCII keyboard conventions for better use."
    (when frame
      (select-frame frame))
    ;; Bound to angle brackets because Meta commands are not recognized if not.
    (define-key input-decode-map (kbd "C-[") (kbd "<C-[>"))
    (define-key input-decode-map (kbd "C-i") (kbd "<C-i>"))
    (define-key input-decode-map (kbd "C-m") (kbd "<C-m>")))
  :init
  (if (daemonp)
      (progn
	(add-hook 'after-make-frame-functions
		  (lambda (frame)
		    (with-selected-frame frame
		      (duckonomy/keys-decode)))))
    (duckonomy/keys-decode))
  :general
  ("<C-return>" 'multi-vterm
   "<C-return>" 'multi-vterm
   "C-`" 'vterm-toggle
   "C-S-k" ''backward-kill-line
   "C-x <deletechar>" 'backward-kill-sentence
   "M-K" 'backward-kill-sentence
   "C-S-M-k" 'backward-kill-sexp
   "C-x M-q" 'read-only-mode

   "C-S-g" 'abort-recursive-edit
   "M-1" 'eyebrowse-switch-to-window-config-1
   "M-2" 'eyebrowse-switch-to-window-config-2
   "M-3" 'eyebrowse-switch-to-window-config-3
   "M-4" 'eyebrowse-switch-to-window-config-4
   "C-S-h" 'mark-defun
   "RET" 'newline-and-indent
   ;; UNSAFE
   "C-;" 'comment-line)

  (:keymaps 'override
	    "C-x C-g" 'keyboard-quit
	    "C-c C-g" 'keyboard-quit
	    "C-x ESC ESC" 'keyboard-quit
	    "C-x ESC" 'keyboard-quit
	    "C-c ESC" 'keyboard-quit
	    "C-h ESC" 'keyboard-quit
	    "C-w ESC" 'keyboard-quit
	    "C-=" 'text-scale-increase
	    "C--" 'text-scale-decrease
	    "C-c 0" 'text-scale-adjust)

  (:prefix "C-c b"
	   "i" 'ibuffer
	   "I" 'counsel-ibuffer
	   "b" 'switch-to-buffer
	   "B" 'counsel-switch-buffer
	   "k" 'kill-buffer
	   "K" 'kill-this-buffer
	   "r" 'revert-buffer)
  (:prefix "C-c l"
	   "r" 'elfeed
	   "i" 'circe
	   "m" 'mpdel-browser-open
	   "d" 'dired
	   "b" 'ibuffer
	   "n" 'notmuch
	   "p" 'package-list-packages
	   "l" 'display-line-numbers-mode)
  (:prefix "C-c ="
	   "m" 'count-matches
	   "l" 'count-lines-page
	   "L" 'count-lines-region
	   "w" 'count-words
	   "W" 'count-words-region))

(use-package which-key
  :straight t
  :init
  (which-key-mode t)
  ;; (which-key-posframe-mode t)
  :config
  (setq which-key-idle-delay 0.5)
  (setq which-key-separator " → " )
  (setq which-key-prefix-prefix "+" ))

(provide 'modules-keybindings)
