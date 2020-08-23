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

(eval-when-compile
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
  )

(eval-when-compile
  (setq-default use-package-verbose t
		use-package-always-defer t
		use-package-compute-statistics t
		use-package-expand-minimally nil
		use-package-enable-imenu-support t)
  (straight-use-package 'use-package))

(use-package general
  :straight t
  :demand t)

(load (concat user-emacs-directory "core/core")
      nil 'nomessage)

(load (concat user-emacs-directory "modules/modules")
      nil 'nomessage)

;;; init.el ends here
