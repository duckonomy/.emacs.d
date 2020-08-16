(defvar core-dir
  (expand-file-name "core" user-emacs-directory))

; (defvar modules-dir
;   (expand-file-name "modules" user-emacs-directory))

(defvar settings-dir
  (expand-file-name "settings" core-dir))
(defvar ui-dir
  (expand-file-name "ui" core-dir))
(defvar files-dir
  (expand-file-name "files" core-dir))
(defvar editor-dir
  (expand-file-name "editor" core-dir))
(defvar org-dir
  (expand-file-name "org" core-dir))
(defvar remote-dir
  (expand-file-name "remote" core-dir))
; (defvar cli-dir
;   (expand-file-name "cli" core-dir))
(defvar performance-dir
  (expand-file-name "performance" core-dir))
(defvar media-dir
  (expand-file-name "media" core-dir))
(defvar buffers-dir
  (expand-file-name "buffers" core-dir))

(add-to-list 'load-path settings-dir)
(add-to-list 'load-path ui-dir)
(add-to-list 'load-path files-dir)
(add-to-list 'load-path editor-dir)
(add-to-list 'load-path org-dir)
(add-to-list 'load-path remote-dir)
; (add-to-list 'load-path cli-dir)
(add-to-list 'load-path performance-dir)
(add-to-list 'load-path media-dir)
(add-to-list 'load-path buffers-dir)

(require 'core-ibuffer)
; (require 'core-eshell)
; (require 'core-shell)
(require 'core-delsel)
(require 'core-eldoc)
(require 'core-format)
(require 'core-isearch)
(require 'core-novice)
(require 'core-parentheses)
(require 'core-saveplace)
(require 'core-scroll)
(require 'core-simple)
(require 'core-auto-revert)
(require 'core-custom-file)
(require 'core-dired)
(require 'core-ediff)
(require 'core-epa-file)
(require 'core-files)
(require 'core-history)
(require 'core-recentf)
(require 'core-doc-view)
(require 'core-image)
(require 'core-org)
(require 'core-performance)
(require 'core-tramp)
(require 'core-vc)
(require 'core-default)
(require 'core-language)
(require 'core-server)
(require 'core-startup)
(require 'core-buffer)
(require 'core-cursor)
(require 'core-frame)
(require 'core-line-numbers)
(require 'core-messages)
(require 'core-minibuffer)
(require 'core-modeline)
(require 'core-ui)
(require 'core-visual-bell)
(require 'core-window)

(provide 'core)
