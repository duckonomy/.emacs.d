(use-package evil
  :straight t
  :init
  (evil-mode 1)
  :hook
  (evil-insert-state-entry . evil-ex-nohighlight)
  :custom
  (evil-want-C-u-scroll t)
  (evil-ex-visual-char-range t)
  (evil-want-visual-char-semi-exclusive t)
  (evil-ex-search-vim-style-regexp t)
  (evil-ex-interactive-search-highlight 'selected-window)
  (evil-echo-state nil)
  (evil-ex-substitute-global t)
  (evil-insert-skip-empty-lines t)
  (evil-want-fine-undo nil)
  :config
  (setq evil-magic t)
  (setq evil-default-state 'emacs)
  (with-eval-after-load 'evil-maps
    (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
    (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)
    ;; UNSAFE
    (define-key evil-motion-state-map (kbd ":") 'evil-ex)
    ;; UNSAFE
    (define-key evil-motion-state-map (kbd ";") 'evil-ex)
    ;; UNSAFE
    (define-key evil-normal-state-map (kbd "SPC") 'avy-goto-word-or-subword-1)
    ;; UNSAFE
    (define-key evil-visual-state-map (kbd "SPC") 'avy-goto-word-or-subword-1))
  (evil-set-initial-state 'prog-mode 'normal)
  (evil-set-initial-state 'sgml-mode 'normal)
  (evil-set-initial-state 'fundamental-mode 'normal)
  (evil-set-initial-state 'sws-mode 'normal)
  (evil-set-initial-state 'text-mode 'normal)
  (evil-set-initial-state 'org-mode 'emacs)
  (evil-set-initial-state 'dired-mode 'emacs)
  ;; (evil-set-initial-state 'info-mode 'emacs)
  ;; (evil-set-initial-state 'man-mode 'emacs)
  ;; (evil-set-initial-state 'woman-mode 'emacs)
  ;; (evil-set-initial-state 'help-mode 'emacs)
  (evil-set-initial-state 'wdired-mode 'emacs)
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-set-initial-state 'conf-mode 'normal)
  ;; (evil-set-initial-state 'conf-windows-mode 'normal)
  ;; (evil-set-initial-state 'conf-toml-mode 'emacs)
  ;; (evil-set-initial-state 'conf-unix-mode 'emacs)
  ;; (evil-set-initial-state 'conf-colon-mode 'emacs)
  ;; (evil-set-initial-state 'conf-space-mode 'emacs)
  ;; (evil-set-initial-state 'conf-desktop-mode 'emacs)
  ;; (evil-set-initial-state 'conf-ppd-mode 'emacs)
  ;; (evil-set-initial-state 'conf-javaprop-mode 'emacs)
  ;; (evil-set-initial-state 'conf-xdefaults-mode 'emacs)
  (evil-select-search-module 'evil-search-module 'evil-search))

(use-package evil-commentary
  :straight t
  :commands
  (evil-commentary evil-commentary-yank evil-commentary-line)
  :init
  (evil-commentary-mode 1))

(use-package evil-surround
  :straight t
  :commands
  (global-evil-surround-mode
   evil-surround-edit
   evil-Surround-edit
   evil-surround-region)
  :config
  (global-evil-surround-mode 1))


(provide 'modules-evil)
