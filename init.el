;;; init.el --- Emacs init file
;; Author: Ian Park
;;; Commentary:
;;; My Emacs config.
;;; Code:

(defvar duckonomy/file-name-handler-alist file-name-handler-alist)

(setq file-name-handler-alist nil
	  gc-cons-threshold most-positive-fixnum
	  gc-cons-percentage 0.6
	  site-run-file nil
	  read-process-ouput-max (* 1024 1024)
	  ad-redefinition-action 'accept)

(setq byte-compile-warnings '(cl-functions))

(defvar duckonomy/gc-cons-threshold (* 20 1024 1024))

(add-hook 'emacs-startup-hook
	  (lambda ()
		(setq gc-cons-threshold duckonomy/gc-cons-threshold
		  gc-cons-percentage 0.1
		  file-name-handler-alist duckonomy/file-name-handler-alist
		  ad-redefinition-action 'warn)))

(add-hook 'minibuffer-setup-hook (lambda ()
				   (setq gc-cons-threshold (* duckonomy/gc-cons-threshold 6))))
(add-hook 'minibuffer-exit-hook (lambda ()
				  (garbage-collect)
				  (setq gc-cons-threshold duckonomy/gc-cons-threshold)))

;; (require 'package)
;; (add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("org"   . "http://orgmode.org/elpa/"))
;; (add-to-list 'package-archives '("ublt" . "https://elpa.ubolonton.org/packages/"))

;; (setq package-enable-at-startup nil)
;; (setq package-pinned-packages '((use-package . "melpa")))
;; (package-initialize)

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (eval-and-compile
;;   (setq use-package-always-ensure nil))

;; (require 'use-package)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))

  ;; My addition
  (setq-default straight-cache-autoloads t
		straight-fix-org t
		straight-fix-flycheck t
		straight-recipe-overrides nil
		straight-repository-branch "develop"
		straight-use-package-by-default t
		straight-check-for-modifications '(check-on-save find-when-checking)
		straight-vc-git-default-clone-depth 1
		straight-check-for-modifications '(check-on-save find-when-checking))

  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq-default use-package-verbose t
	      use-package-always-defer t
	      use-package-compute-statistics t
	      use-package-expand-minimally nil
	      use-package-enable-imenu-support t)

(straight-use-package 'use-package)
(setq-default straight-use-package-by-default t)

(setq duck/built-in-pseudo-packages '(simple epa js-mode eshell shell saveplace dired autorevert image-mode files cursor tex-site
					     frame buffer line-numbers messages minibuffer modeline tabs visual-bell window-settings
					     tool-bar scroll-bar menu-bar fringe tooltip auth-source delsel scroll cus-edit
					     dired-x doc-view vc-hooks window-management whitespace nxml-mode find-file
					     eldoc paren theme isearch novice recentf savehist jit-lock bookmark editing
					     theme startup-settings doc-view format indentation visual-fill-column performance faces
					     hippie-expand languages encoding))

(dolist (package duck/built-in-pseudo-packages)
  (add-to-list 'straight-built-in-pseudo-packages package))

;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("ublt" . "https://elpa.ubolonton.org/packages/"))
;; ;; (package-initialize)

(load (concat user-emacs-directory "core/core")
	  nil 'nomessage)

(load (concat user-emacs-directory "modules/modules")
	  nil 'nomessage)

;;; init.el ends here
