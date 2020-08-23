(use-package winner
  :straight t
  :init
  (winner-mode t)
  )

(use-package window-management
  :preface
  (defun prev-window ()
	"Previous window."
	(interactive)
	(other-window -1))
  (defun toggle-maximize-buffer () "Maximize buffer"
		 (interactive)
		 (if (= 1 (length (window-list)))
			 (jump-to-register '_)
		   (progn
			 (window-configuration-to-register '_)
			 (delete-other-windows))))
  :bind
  (("C-x O" . prev-window)
   ("C-x w" . kill-this-buffer)
   ("C-S-o" . toggle-maximize-buffer)
   ("C-x M-k" . kill-this-buffer)
   ("C-x K" . kill-this-buffer)
   ("C-M-{" . shrink-window-horizontally)
   ("C-M-}" . enlarge-window-horizontally)
   ("C-M-^" . enlarge-window)))

(use-package ace-window
  :straight t
  :preface
  (require 'ace-window)

  ;; (defun ace-delete-window ()
  ;;	"Ace delete window."
  ;;	(interactive)
  ;;	(aw-delete-window
  ;;	 (aw-select " Ace - Delete Window")))

  ;; (defun aw-delete-window (window)
  ;;	"Delete window WINDOW."
  ;;	(let ((frame (window-frame window)))
  ;;	  (when (and (frame-live-p frame)
  ;;				 (not (eq frame (selected-frame))))
  ;;		(select-frame-set-input-focus (window-frame window)))
  ;;	  (if (= 1 (length (window-list)))
  ;;		  (delete-frame frame)
  ;;		(if (window-live-p window)
  ;;			(delete-window window)
  ;;		  (error "Got a dead window %S" window)))))

  ;; (defun ace-maximize-window ()
  ;;	"Ace maximize window."
  ;;	(interactive)
  ;;	(select-window (aw-select " Ace - Maximize Window"))
  ;;	(delete-other-windows))

  (defvar aw-dispatch-alist
	'((?x aw-delete-window "Delete Window")
	  (?m aw-swap-window "Swap Windows")
	  (?M aw-move-window "Move Window")
	  (?c aw-copy-window "Copy Window")
	  (?j aw-switch-buffer-in-window "Select Buffer")
	  (?n aw-flip-window)
	  (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
	  (?c aw-split-window-fair "Split Fair Window")
	  (?v aw-split-window-vert "Split Vert Window")
	  (?b aw-split-window-horz "Split Horz Window")
	  (?o delete-other-windows "Delete Other Windows")
	  (?? aw-show-dispatch-help))
	"List of actions for `aw-dispatch-default'.")
  ;; UNSAFE (Enrich text)
  :bind
  (("M-o" . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (set-face-attribute 'aw-leading-char-face nil
					  :weight 'bold
					  :foreground "#CC6666"
					  :height 1.0))

(provide 'modules-window)
