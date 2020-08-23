(use-package dired
  :straight (:type built-in)
  :hook
  (dired-mode . hl-line-mode)
  (dired-mode . dired-hide-details-mode)
  :general
  (:keymaps 'dired-mode-map
   "C-x M-q" 'dired-toggle-read-only)
  :config
  (eval-after-load "dired"
    #'(lambda ()
	(put 'dired-find-alternate-file 'disabled nil)
	(define-key dired-mode-map (kbd "RET") #'dired-find-alternate-file)))
  (setq image-dired-thumb-margin 5)
  (setq image-dired-external-viewer "/usr/bin/qimgv")
  (setq delete-by-moving-to-trash t)
  :custom
  (dired-listing-switches "-al --group-directories-first")
  ;; Always copy/delete recursively
  (dired-recursive-copies  'always)
  (dired-recursive-deletes 'top))

(use-package dired-x
  :straight (:type built-in)
  :general
  ([remap list-directory] 'dired-jump)
  :config
  ;; do not bind C-x C-j since it's used by jabber.el
  (setq dired-bind-jump nil))

(use-package wdired
  :straight t
  :config
  (setq wdired-allow-to-change-permissions t)
  :general
  (:keymaps 'wdired-mode-map
	    "C-x M-q" 'wdired-exit))

(use-package dired-narrow
  :straight t)

(use-package dired-ranger
  :straight t
  :general
  (:keymaps 'dired-mode-map
	    "W" 'dired-ranger-copy
	    "X" 'dired-ranger-move
	    "Y" 'dired-ranger-paste))

(use-package dired-toggle
  :straight t
  )

(use-package dired-hide-dotfiles
  :straight t
  :general
  (:keymaps 'dired-mode-map
	    "." 'dired-hide-dotfiles-mode)
  :hook
  (dired-mode . dired-hide-dotfiles-mode))

(use-package dired-rsync
  :straight t
  :general
  (:keymaps 'dired-mode-map
	    "r" 'dired-rsync))

(use-package dired-launch
  :straight t
  :preface
  (require 'cl-lib)
  :hook
  (dired-mode . dired-launch-mode)
  :config
  (setq dired-launch-default-launcher '("xdg-open")))

(use-package dired-git-info
  :straight t
  :general
  (:keymaps 'dired-mode-map
	    ")" 'dired-git-info-mode))

(use-package dired-recent
  :straight t
  :general
  (:keymaps 'dired-recent-mode-map "C-x C-d" 'nil)
  :config
  (dired-recent-mode 1))

(use-package dired-subtree
  :straight t
  :config
  :general
  (:keymaps 'dired-mode-map
	    "i" 'dired-subtree-insert
	    ";" 'dired-subtree-remove))

(provide 'core-dired)
