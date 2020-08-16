(defvar modules-dir
  (expand-file-name "modules" user-emacs-directory))

(defvar ui-dir
  (expand-file-name "ui" modules-dir))
(defvar editor-dir
  (expand-file-name "editor" modules-dir))

(defvar organization-dir
  (expand-file-name "organization" modules-dir))
(defvar menu-dir
  (expand-file-name "menu" modules-dir))
(defvar correction-dir
  (expand-file-name "correction" modules-dir))
(defvar completion-dir
  (expand-file-name "completion" modules-dir))
(defvar languages-dir
  (expand-file-name "languages" modules-dir))
(defvar cli-dir
  (expand-file-name "cli" modules-dir))
(defvar vc-dir
  (expand-file-name "vc" modules-dir))
; (defvar notifications-dir
;   (expand-file-name "notifications" modules-dir))
; (defvar pdf-dir
;   (expand-file-name "pdf" modules-dir))
; (defvar mail-dir
;   (expand-file-name "mail" modules-dir))
(defvar ledger-dir
  (expand-file-name "ledger" modules-dir))
(defvar prose-dir
  (expand-file-name "prose" modules-dir))

; (add-to-list 'load-path ui-dir)
; (add-to-list 'load-path editor-dir)

(add-to-list 'load-path "~/.config/emacs/modules/ui")
(add-to-list 'load-path "~/.config/emacs/modules/editor")

(add-to-list 'load-path organization-dir)
(add-to-list 'load-path menu-dir)
(add-to-list 'load-path correction-dir)
(add-to-list 'load-path completion-dir)
(add-to-list 'load-path languages-dir)
(add-to-list 'load-path cli-dir)
(add-to-list 'load-path vc-dir)
; (add-to-list 'load-path notifications-dir)
; (add-to-list 'load-path pdf-dir)
; (add-to-list 'load-path mail-dir)
(add-to-list 'load-path ledger-dir)
(add-to-list 'load-path prose-dir)

(require 'modules-vterm)
(require 'modules-company)
(require 'modules-yasnippets)
(require 'modules-flycheck)
; (require 'modules-flymake)
; (require 'modules-flyspell)
; (require 'modules-typo)

(require 'modules-anzu)
(require 'modules-avy)
(require 'modules-delimiters)
(require 'modules-evil)
(require 'modules-expand)
(require 'modules-hl-todo)
(require 'modules-keybindings)
(require 'modules-multi-cursor)
(require 'modules-undo-tree)
(require 'modules-whitespace)

(require 'modules-c)
(require 'modules-go)
(require 'modules-js)
(require 'modules-latex)
(require 'modules-lsp)
(require 'modules-markdown)
(require 'modules-opengl)
(require 'modules-rust)
(require 'modules-web)
(require 'modules-xml)
(require 'modules-ledger)
; (require 'modules-notmuch)
(require 'modules-counsel)
; (require 'modules-fzf)
(require 'modules-ivy)
(require 'modules-swiper)
; (require 'modules-elcord)
(require 'modules-bookmarks)
(require 'modules-buffer)
; (require 'modules-projectile)
; (require 'modules-tabs)
; (require 'modules-treemacs)
(require 'modules-window)
; (require 'modules-pdf-tools)
(require 'modules-writeroom)
(require 'modules-faces)
; (require 'modules-icons)
(require 'modules-modeline)
; (require 'modules-rainbow-identifier)
(require 'modules-theme)
; (require 'modules-tooltip)
(require 'modules-git)

(provide 'modules)
