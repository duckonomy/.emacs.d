(use-package eshell
  :straight (:type built-in)
  :preface
  (defun chunyang-eshell-mode-setup ()
	(remove-hook 'eshell-output-filter-functions
				 'eshell-postoutput-scroll-to-bottom))
  (defun rm-comint-postoutput-scroll-to-bottom ()
	(remove-hook 'comint-output-filter-functions
				 'comint-postoutput-scroll-to-bottom))
  (defun duckonomy/eshell-clear-prompt ()
	"Clear `eshell' buffer, comint-style."
	(interactive)
	(let ((input (eshell-get-old-input)))
	  (eshell/clear-scrollback)))
  ;; this works best :)
  (defun duckonomy/eshell-clear ()
	"Clear `eshell' buffer, comint-style."
	(interactive)
	(let ((input (eshell-get-old-input)))
	  (eshell/clear-scrollback)
	  (eshell-emit-prompt)
	  (insert input)))
  (defun shortened-path (path max-len)
	"Return a modified version of PATH, replacing some components.
with single characters starting from the left to try and get
the path down to MAX-LEN"
	(let* ((components (split-string (abbreviate-file-name path) "/"))
		   (len (+ (1- (length components))
				   (reduce '+ components :key 'length)))
		   (str ""))
	  (while (and (> len max-len)
				  (cdr components))
		(setq str (concat str (if (= 0 (length (car components)))
								  "/"
								(string (elt (car components) 0) ?/)))
			  len (- len (1- (length (car components))))
			  components (cdr components)))
	  (concat str (reduce (lambda (a b) (concat a "/" b)) components))))
  (defun eshell-new()
	"Open a new instance of eshell."
	(interactive)
	(eshell 'N))
  :config
  (setq-default eshell-cmpl-cycle-completions nil)
  (setq-default eshell-buffer-maximum-lines 20000)
  (setq-default eshell-history-size 350)
  (setq-default eshell-hist-ignoredups t)
  (setq-default eshell-buffer-shorthand t)
  (setq-default eshell-highlight-prompt nil)
  (setq-default eshell-plain-echo-behavior t)
  (setq-default eshell-scroll-to-bottom-on-output nil)
  (setq-default comint-move-point-for-output t)
  (setq-default eshell-prompt-function
				(lambda ()
				  (concat
				   (propertize "┌─[" 'face `(:foreground "#61AFEF"))
				   ;; (propertize (concat (eshell/pwd)) 'face `(:foreground "#56B6C2"))
				   (propertize (shortened-path (eshell/pwd) 40) 'face `(:foreground "#56B6C2"))

				   (if (magit-get-current-branch)
					   (concat
						(propertize "@" 'face `(:foreground "#98C379"))
						(propertize (magit-get-current-branch) 'face `(:foreground "#98C379")))
					 "")
				   (propertize "]──[" 'face `(:foreground "#61AFEF"))
				   (propertize (format-time-string "%I:%M %p" (current-time)) 'face `(:foreground "#D56871"))
				   (propertize "]\n" 'face `(:foreground "#61AFEF"))
				   (propertize "└─>" 'face `(:foreground "#61AFEF"))
				   (propertize (if (= (user-uid) 0) " # " " $ ") 'face `(:foreground "#E5C07B")))))
  :hook
  ((eshell-mode . chunyang-eshell-mode-setup)
   (eshell-mode . (lambda()
					(local-set-key (kbd "C-l") 'duckonomy/eshell-clear)))
   (eshell-mode . (lambda()
					(local-set-key (kbd "<tab>") 'completion-at-point)))
   (comint-mode . rm-comint-postoutput-scroll-to-bottom)
   (eshell-banner-load . (lambda () (setq eshell-banner-message "")))))

(provide 'core-eshell)
