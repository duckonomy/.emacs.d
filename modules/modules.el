(add-to-list 'load-path (file-name-directory load-file-name))

(defconst duck-emacs-dir
  (file-truename user-emacs-directory))

(defconst duck-modules-dir (concat duck-emacs-dir "modules/"))

(dolist (f (directory-files duck-modules-dir))
	(let ((name (concat duck-modules-dir f)))
	  (when (and (file-directory-p name)
				 (not (equal f ".."))
				 (not (equal f ".")))
		(add-to-list 'load-path name))))

;; Cli
(require 'modules-vterm)

;; Completion
(require 'modules-company)
(require 'modules-yasnippets)

;; Correction
(require 'modules-flycheck)
(require 'modules-flyspell)
;; (require 'modules-flymake)
;; (require 'modules-typo)

;; Editor
(require 'modules-anzu)
(require 'modules-avy)
(require 'modules-delimiters)
(require 'modules-evil)
;; (require 'modules-modal)
(require 'modules-expand)
(require 'modules-hl-todo)
(require 'modules-hydra)
(require 'modules-keybindings)
(require 'modules-multi-cursor)
(require 'modules-undo)
(require 'modules-whitespace)

;; Languages
(require 'modules-lsp)
(require 'modules-tree-sitter)
(require 'modules-c)
(require 'modules-go)
(require 'modules-js)
(require 'modules-latex)
(require 'modules-markdown)
(require 'modules-opengl)
(require 'modules-rust)
(require 'modules-web)
(require 'modules-xml)

;; Applications
(require 'modules-ledger)
(require 'modules-elfeed)
(require 'modules-notmuch)
(require 'modules-pdf-tools)
(require 'modules-irc)
;; (require 'modules-esv)

;; Menu
(require 'modules-counsel)
(require 'modules-ivy)
(require 'modules-swiper)
(require 'modules-imenu)
;; (require 'modules-fzf)

;; Notifications
;; (require 'modules-elcord)

;; Organization
(require 'modules-bookmarks)
(require 'modules-buffer)
(require 'modules-projectile)
(require 'modules-treemacs)
(require 'modules-window)
(require 'modules-workspaces)
;; (require 'modules-tabs)

;; Prose
(require 'modules-writeroom)

;; UI
(require 'modules-faces)
(require 'modules-modeline)
(require 'modules-theme)
(require 'modules-tooltip)
;; (require 'modules-beacon)
;; (require 'modules-icons)
;; (require 'modules-rainbow-identifier)

;; VC
(require 'modules-git)

(provide 'modules)
