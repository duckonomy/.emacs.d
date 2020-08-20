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

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org"   . "http://orgmode.org/elpa/"))

(setq package-enable-at-startup nil)
(setq package-pinned-packages '((use-package . "melpa")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure nil))

(require 'use-package)

(load (concat user-emacs-directory "core/core")
	  nil 'nomessage)

(load (concat user-emacs-directory "modules/modules")
	  nil 'nomessage)

;;; init.el ends here
