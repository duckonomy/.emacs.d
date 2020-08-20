(use-package dired
  :ensure nil
  :hook
  (dired-mode . dired-hide-details-mode)
  :bind
  (:map dired-mode-map
		("C-x M-q" . dired-toggle-read-only))
  :config
  (eval-after-load "dired"
	#'(lambda ()
		(put 'dired-find-alternate-file 'disabled nil)
		(define-key dired-mode-map (kbd "RET") #'dired-find-alternate-file)))
  (setq image-dired-thumb-margin 5)
  (setq image-dired-external-viewer "/usr/bin/qimgv")
  (setq delete-by-moving-to-trash t)
  ;; Set trash directory
  )

(use-package wdired
  :ensure nil
  :config
  (setq wdired-allow-to-change-permissions t)
  :bind
  (:map wdired-mode-map
		("C-x M-q" . wdired-exit)))

(use-package dired-narrow
  :ensure t)

(use-package dired-ranger
  :ensure t
  :bind
  (:map dired-mode-map
		("W" . dired-ranger-copy)
		("X" . dired-ranger-move)
		("Y" . dired-ranger-paste)))

(use-package dired-x
  :bind
  ([remap list-directory] . dired-jump)
  :config
  ;; do not bind C-x C-j since it's used by jabber.el
  (setq dired-bind-jump nil))


(use-package dired-toggle
  :ensure t
  :defer t)

(use-package dired-hide-dotfiles
  :ensure t
  :bind
  (:map dired-mode-map
		("." . dired-hide-dotfiles-mode))
  :hook
  (dired-mode . dired-hide-dotfiles-mode))

(use-package dired-rsync
  :ensure t
  :bind
  (:map dired-mode-map
		("r" . dired-rsync)))

(use-package dired-launch
  :ensure t
  :preface
  (require 'cl)
  :hook
  (dired-mode . dired-launch-mode)
  :config
  (setq dired-launch-default-launcher '("xdg-open")))

(use-package dired-git-info
  :ensure t
  :bind
  (:map dired-mode-map
		(")" . dired-git-info-mode)))

(use-package dired-recent
  :ensure t
  :bind
  (:map
   dired-recent-mode-map ("C-x C-d" . nil))
  :config
  (dired-recent-mode 1))

(use-package dired-subtree
  :ensure t
  :config
  :bind
  (:map dired-mode-map
		("i" . dired-subtree-insert)
		(";" . dired-subtree-remove)))

(provide 'core-dired)
