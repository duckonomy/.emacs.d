(use-package bind-key
  :straight t
  :preface
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
  :config
  (bind-key "C-S-g" 'abort-recursive-edit)
  (bind-key "M-1" 'eyebrowse-switch-to-window-config-1)
  (bind-key "M-2" 'eyebrowse-switch-to-window-config-2)
  (bind-key "M-3" 'eyebrowse-switch-to-window-config-3)
  (bind-key "M-4" 'eyebrowse-switch-to-window-config-4)
  ;; UNSAFE in terminal
  ;; (bind-key* "<C-[>" 'butterfly)
  ;; UNSAFE in terminal
  ;; (bind-key* "<C-i>" 'butterfly)
  ;; UNSAFE in terminal
  ;; (bind-key* "<C-m>" 'butterfly)

  ;; (bind-key* "C-+" 'text-scale-increase)
  ;; SEMI-SAFE (Duplicate undo) Breaks global-undo-tree-mode
  ;; (bind-key* "C-_" 'text-scale-decrease)
  ;; UNSAFE in eshell
  ;; (bind-key* "C-c =" 'text-scale-increase)
  ;; (bind-key* "C-c -" 'text-scale-decrease)
  ;; These are probably unsafe LOL
  (bind-key* "C-=" 'text-scale-increase)
  (bind-key* "C-x C-g" 'keyboard-quit)
  (bind-key* "C-c C-g" 'keyboard-quit)
  (bind-key* "C-x ESC ESC" 'keyboard-quit)
  (bind-key* "C-x ESC" 'keyboard-quit)
  (bind-key* "C-c ESC" 'keyboard-quit)
  (bind-key* "C-h ESC" 'keyboard-quit)
  (bind-key* "C-w ESC" 'keyboard-quit)
  (bind-key* "C--" 'text-scale-decrease)
  (bind-key* "C-c 0" 'text-scale-adjust)
  (bind-key "C-S-h" 'mark-defun)
  (bind-key "RET" 'newline-and-indent)
  (bind-key "C-;" 'comment-line))

(use-package editing
  :preface
  (defun backward-kill-line (arg)
	"Kill ARG lines backward."
	(interactive "p")
	(kill-line (- 1 arg)))
  :bind
  ;; (("C-c t n" . multi-vterm)
   ("<C-return>" . multi-vterm)
   ("<C-return>" . multi-vterm)
   ("C-`" . vterm-toggle)
   ("C-S-k" . 'backward-kill-line)
   ("C-x <deletechar>" . backward-kill-sentence)
   ("M-K" . backward-kill-sentence)
   ("C-S-M-k" . backward-kill-sexp)
   ("C-x M-q" . read-only-mode)
   )

(use-package general
  :straight t
  :config
  ;; (general-define-key
  ;;  "C-x b" nil
  ;;  )
  (general-define-key
   :prefix "C-c b"
   "i" 'ibuffer
   "I" 'counsel-ibuffer
   "b" 'switch-to-buffer
   "B" 'counsel-switch-buffer
   "k" 'kill-buffer
   "K" 'kill-this-buffer
   "r" 'revert-buffer
   )

  (general-define-key
   :prefix "C-c l"
   "r" 'elfeed
   "i" 'circe
   "m" 'mpdel-browser-open
   "d" 'dired
   "b" 'ibuffer
   "n" 'notmuch
   "p" 'package-list-packages
   "l" 'display-line-numbers-mode)

  (general-define-key
   :prefix "C-c ="
   "m" 'count-matches
   "l" 'count-lines-page
   "L" 'count-lines-region
   "w" 'count-words
   "W" 'count-words-region
   )
  )

(use-package which-key
  :straight t
  :init
  (which-key-mode t)
   ;; (which-key-posframe-mode t)
  :config
  (setq which-key-idle-delay 0.5)
  (setq which-key-separator " → " )
  (setq which-key-prefix-prefix "+" )
  )

(provide 'modules-keybindings)
