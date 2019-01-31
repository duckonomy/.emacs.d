;; -*- lexical-binding: t -*-

(package-initialize)

(require 'org)
(org-babel-load-file
 (expand-file-name "README.org"
                   user-emacs-directory))


(setq package--init-file-ensured t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("57f95012730e3a03ebddb7f2925861ade87f53d5bbb255398357731a7b1ac0e0" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
