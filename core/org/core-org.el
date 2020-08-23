(use-package org
  :straight t
  :straight htmlize
  :straight org-plus-contrib
  :mode ("\\.org\\'" . org-mode)
  :preface

  (defun my-org-comment-dwim (&optional arg)
    "Org-comment ARG dwim."
    (interactive "P")
    (or (org-babel-do-key-sequence-in-edit-buffer (kbd "M-;"))
	(comment-dwim arg)))

  (define-skeleton org-skeleton
    "Header info for a Emacs-org file."
    "Title: "
    "#+TITLE:" str " \n"
    "#+AUTHOR: Ian Park\n"
    )
  ;; UNSAFE
  :bind
  (
   ;; ("C-c i" . org-store-link)
   ;; ("C-c c" . org-capture)
   ;; ("C-c a" . org-agenda)
   ;; ("C-c j" . org-clock-goto)
   :map org-mode-map
   ("C-]" . org-metaright)
   ("<C-[>" . org-metaleft)
   ("C-}" . org-shiftmetaright)
   ("C-{" . org-shiftmetaleft)
   ("M-]" . org-metaup)
   ("M-[" . org-metadown)
   ("M-}" . org-shiftmetaup)
   ("M-{" . org-shiftmetadown)
   ("C-)" . org-forward-element)
   ("C-(" . org-backward-element)
   ("<M-tab>" . org-force-cycle-archived)
   ("<C-tab>" . nil))
  :config
  (general-define-key
   :prefix "C-c r"
   "i" 'org-store-link
   "c" 'org-capture
   "C" 'counsel-org-capture
   "a" 'org-agenda
   "h" 'counsel-org-agenda-headlines
   "j" 'org-clock-goto
   )

  (defhydra hydra-org-mode (:color "#1098F7")
    "Org-mode"
   ("g" counsel-org-goto "goto")
   ("e" counsel-org-entity "entity")
   ("i" imenu-list-smart-toggle "imenu")
   ("s" org-sort "sort")
   ("TAB" org-cycle "tab")
   ("<S-iso-lefttab>" org-shifttab "shift tab")
   ("h" org-metaleft "left")
   ("l" org-metaright "right")
   ("H" org-shiftmetaleft "shift left")
   ("L" org-shiftmetaright "shift right")
   ("j" org-metadown "down")
   ("k" org-metaup "up")
   ("J" org-shiftmetadown "shift down")
   ("K" org-shiftmetaup "shift up")
   ("P" org-backward-element "backward")
   ("N" org-forward-element "forward")
   ("p" org-previous-visible-heading "previous")
   ("n" org-next-visible-heading "next"))

  (general-define-key
   :keymaps 'org-mode-map
   "C-c c" 'hydra-org-mode/body)

  ;; (add-hook 'after-init-hook
  ;; (lambda ()
  ;; (require 'org-indent)       ; for org-indent face
  ;; (set-face-attribute 'org-indent nil
  ;; :inherit '(org-hide fixed-pitch))))

  (font-lock-add-keywords 'org-mode
			  '(("^ +\\([-*]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (org-clock-persistence-insinuate)
  (org-load-modules-maybe t)

  ;; Babel
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (R . t)
     (dot . t)
     (haskell . t)
     (python . t)
     (shell . t)
     (C . t)
     (sql . t)
     ))
  :config
  (setq org-src-preserve-indentation t
	org-edit-src-content-indentation 0)
  (setq org-hide-emphasis-markers t)
  (setq org-hide-leading-stars t)
  (setq org-ellipsis "…")
  (setq org-startup-indented t)
  (setq org-src-tab-acts-natively t)
  (setq org-src-fontify-natively t)
  (setq org-pretty-entities t)
  (setq org-use-speed-commands t)
  (setq org-adapt-indentation t)
  (setq-default auto-fill-mode t)
  (setq org-format-latex-options
	'(:foreground "#2C302E"
		      :background default
		      :scale 2.2
		      :html-foreground "#2C302E"
		      :html-background "Transparent"
		      :html-scale 1.4))
  (setq org-directory "~/Documents")
  (setq org-agenda-files
	(list (concat org-directory "/schedule.org") (concat org-directory "/todo.org")))
  (setq-default org-mobile-directory "~/Documents")
  (setq org-default-notes-file (concat org-directory "/schedule.org"))

  (setq-default org-agenda-skip-scheduled-if-done t)

  (setq-default org-agenda-sorting-strategy
		'((agenda habit-down time-up priority-down category-keep)
		  (todo category-up priority-down)
		  (tags priority-down category-keep)
		  (search category-keep)))
  (setq org-confirm-babel-evaluate nil)

  (setq-default org-clock-persist t)
  (setq org-file-apps
	'((auto-mode . emacs)
	  ("\\.mm\\'" . system)
	  ("\\.x?html?\\'" . "firefox %s")
	  ;; ("\\.pdf::\\([0-9]+\\)\\'" . "llpp \"%s\" -P %1")
	  ;; ("\\.pdf\\'" . "llpp \"%s\"")
	  ))
  (setq org-refile-targets (quote ((org-agenda-files :maxlevel . 4))))
  (setq-default org-agenda-span 'month)

  (setq org-return-follows-link t)

  (setq-default org-agenda-custom-commands
		'(("w" todo "WAITING" nil)
		  ("n" todo "NEXT" nil)
		  ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))))
  (setq-default org-capture-templates
		'(("t" "Task" entry (file+headline "" "Tasks")
		   "* TODO %?\n  %U\n  %a")))
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-use-speed-commands t)
  (setq org-todo-keywords
	'((sequence "TODO(t)" "VERIFY(v)" "FEEDBACK(p)" "NOT STARTED(n)" "|" "WORKING(g)" "FINISHING(i)" "MAYBE(m)" "ALMOST(a)" "WAITING(w)" "STARTED(s)" "DELEGATED(e)" "|" "DONE(d)" "CANCELLED(c)" "DEFERRED(o)" "FINISHED(z)")
	  (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
	  (sequence "(q)")
	  ))

  (setq org-todo-keyword-faces
	'(
	  ("WORKING"   . warning)
	  ("FINISHING" . warning)
	  ("MAYBE"     . warning)
	  ("ALMOST"    . warning)
	  ("WAITING"   . warning)
	  ("STARTED"   . warning)
	  ("DELEGATED" . warning)
	  ))

  (setq-default org-clock-mode-line-total 'current)
  (setq-default org-publish-project-alist
		'(("html"
		   :base-directory "~/Development/"
		   :base-extension "org"
		   :publishing-directory "~/Development/"
		   :publishing-function org-publish-org-to-html)
		  ("pdf"
		   :base-directory "~/Documents/Essay/pdf/"
		   :base-extension "org"
		   :publishing-directory "~/Documents/Essay/pdf/"
		   :publishing-function org-publish-org-to-pdf)
		  ("all" :components ("html" "pdf"))))

  (setq-default org-latex-logfiles-extensions (quote ("lof" "lot" "tex" "tex~" "aux"
						      "idx" "log" "out" "toc" "nav"
						      "snm" "vrb" "dvi" "fdb_latexmk"
						      "blg" "brf" "fls" "entoc" "ps"
						      "spl" "bbl")))

  (setq-default org-latex-listings 'minted
		org-latex-packages-alist '(("" "minted"))
		org-latex-pdf-process
		'("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
		  "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
  (setq-default TeX-auto-untabify 't)

  (setq org-list-allow-alphabetical t))


;; (require 'cl-lib)
;; (require 'org)
;; (defun org-indent-use-stars-for-strings ()
;;   "Initialize the indentation strings with stars instead of spaces."
;;   (setq org-indent-strings (make-vector (1+ org-indent-max) nil))
;;   (aset org-indent-strings 0 nil)
;;   (loop for i from 1 to org-indent-max do
;;		(aset org-indent-strings i
;;               (org-add-props
;;				  (concat (make-string (1- i) ?*) ; <- THIS IS THE ONLY CHANGE
;;						  (char-to-string org-indent-boundary-char))
;;				  nil 'face 'org-indent))))

;; (advice-add 'org-indent-initialize :after #'org-indent-use-stars-for-strings)
;; ;; (set-face-foreground 'org-indent "white")
;; (setq-default org-pretty-entities t
;;               org-hide-leading-stars t
;;               org-pretty-entities-include-supersubscripts t)
;; (setq org-indent-mode t)
;; (setq org-adapt-indentation t)
;; (setq org-startup-indented t)
;; (with-eval-after-load 'org
;;   (setq org-startup-indented t) ; Enable `org-indent-mode' by default
;;   (add-hook 'org-mode-hook #'visual-line-mode)
;;   (add-hook 'org-mode-hook #'adaptive-wrap-prefix-mode))

;; ;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
;; (add-hook 'after-init-hook
;;		  (lambda ()
;;			(require 'org-indent)       ; for org-indent face
;;			(set-face-attribute 'org-indent nil
;;								:inherit '(org-hide fixed-pitch))))

(use-package org-journal
  :straight t
  :preface
  (defun org-journal-date-format-func (time)
    "Custom function to insert journal date header.

	When buffer is empty prepend a header in front the entry header."
    (concat (when (= (buffer-size) 0)
	      (concat
	       (pcase org-journal-file-type
		 (`daily "#+TITLE: Daily Journal")
		 (`weekly "#+TITLE: Weekly Journal")
		 (`monthly "#+TITLE: Monthly Journal")
		 (`yearly "#+TITLE: Yearly Journal"))))
	    org-journal-date-prefix
	    (format-time-string "%A, %x" time)))


  :config
  (setq org-journal-dir "~/Documents/Journal/")
  (setq org-journal-date-format 'org-journal-date-format-func))
;; ("%A, %d %B %Y")

;; Tangle Emacs Config
;; (use-package ob-tangle
;;   :preface
;;   (defun tangle-dotemacs ()
;;	"If the current buffer is 'init.org' the code-blocks are tangled, and the tangled file is compiled."
;;	(when (equal (buffer-file-name)
;;				 (expand-file-name (concat user-emacs-directory "README.org")))
;;	  (let ((prog-mode-hook nil))
;;		(org-babel-tangle)
;;		;; (byte-compile-file (concat user-emacs-directory "README.el"))
;;		)))
;;   (defun tangle-dotfiles ()
;;	"If the current file is in '~/etc', the code blocks are tangled."
;;	(when (equal (file-name-directory (directory-file-name buffer-file-name))
;;				 (concat (getenv "HOME") "/lib/themes/"))
;;	  (org-babel-tangle)
;;	  (message "%s tangled" buffer-file-name)))
;;   ;; :hook
;;   ;;       ((after-save . tangle-dotemacs)
;;   ;;        (after-save . tangle-dotfiles))
;;   ;; :config
;;   ;; (add-to-list 'org-babel-default-header-args:R
;;   ;;				   '(:preamble . "library(mosaic)\nlibrary(ggformula)"))
;;   :config
;;   (setq org-confirm-babel-evaluate nil))

(use-package org-bullets
  :straight t
  :commands
  (org-bullets-mode)
  :hook
  (org-mode . (lambda () (org-bullets-mode 1)))
  :config
  (setq org-bullets-bullet-list '("#" "#" "#" "•" "•" "•" "•" "•" "•" "•" "•" "•" "•" "•" ))
  (setq org-bullets-face-name (quote org-bullets-face))
  :init
  (defface org-bullets-face
    '(
      (t (
	  :foreground "#42B983"
	  :family "Noto Sans CJK KR"
	  :weight bold
	  :slant italic
	  :height 1.4
	  )))
    ;; This document is necessary as an argument
    "face font for org-bullets"
    :group 'org-faces))

(use-package org-roam
  :straight t
  :hook
  (after-init . org-roam-mode)
  :config
  (setq org-roam-directory "~/Documents/Vault")
  :bind
  (:map org-roam-mode-map
	(("C-c n l" . org-roam)
	 ("C-c n f" . org-roam-find-file)
	 ("C-c n j" . org-roam-jump-to-index)
	 ("C-c n b" . org-roam-switch-to-buffer)
	 ("C-c n g" . org-roam-graph))
	:map org-mode-map
	(("C-c n i" . org-roam-insert))))

(provide 'core-org)
