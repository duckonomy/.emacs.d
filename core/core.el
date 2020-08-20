(add-to-list 'load-path (file-name-directory load-file-name))

(defconst duck-emacs-dir
  (file-truename user-emacs-directory))

(defconst duck-core-dir (concat duck-emacs-dir "core/"))

(dolist (f (directory-files duck-core-dir))
	(let ((name (concat duck-core-dir f)))
	  (when (and (file-directory-p name)
				 (not (equal f ".."))
				 (not (equal f ".")))
		(add-to-list 'load-path name))))

;; Buffer
(require 'core-ibuffer)

;; Cli
;; (require 'core-eshell)
;; (require 'core-shell)

;; Editor
(require 'core-delsel)
(require 'core-eldoc)
(require 'core-format)
(require 'core-isearch)
(require 'core-novice)
(require 'core-parens)
(require 'core-saveplace)
(require 'core-scroll)
(require 'core-simple)

;; Files
(require 'core-auto-revert)
(require 'core-custom-file)
(require 'core-dired)
(require 'core-ediff)
(require 'core-epa-file)
(require 'core-files)
(require 'core-history)
(require 'core-recentf)

;; Media
(require 'core-doc-view)
(require 'core-image)
(require 'core-music)

;; Org
(require 'core-org)

;; Performance
(require 'core-performance)

;; Remote
(require 'core-tramp)
(require 'core-vc)

;; Settings
(require 'core-default)
(require 'core-language)
(require 'core-server)
(require 'core-startup)

;; UI
(require 'core-buffer)
(require 'core-cursor)
(require 'core-frame)
(require 'core-line-numbers)
(require 'core-messages)
(require 'core-minibuffer)
(require 'core-modeline)
;; (require 'core-tabs)
(require 'core-ui)
(require 'core-visual-bell)
(require 'core-window)

(provide 'core)
