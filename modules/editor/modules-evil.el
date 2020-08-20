(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  :hook
  (evil-insert-state-entry . evil-ex-nohighlight)
  :config
  (setq evil-magic t)
  (setq evil-want-C-u-scroll t)
  (setq evil-ex-visual-char-range t)
  (setq evil-want-visual-char-semi-exclusive t)
  (setq evil-ex-search-vim-style-regexp t)
  (setq evil-ex-interactive-search-highlight 'selected-window)
  (setq evil-echo-state nil)
  (setq evil-ex-substitute-global t)
  (setq evil-insert-skip-empty-lines t)
  (setq evil-want-fine-undo nil)
  (setq evil-default-state 'emacs)
  (with-eval-after-load 'evil-maps
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
  :ensure t
  :commands
  (evil-commentary evil-commentary-yank evil-commentary-line)
  :init
  (evil-commentary-mode 1))

(use-package evil-surround
  :ensure t
  :commands
  (global-evil-surround-mode
   evil-surround-edit
   evil-Surround-edit
   evil-surround-region)
  :config
  (global-evil-surround-mode 1))

;; (use-package modalka
;;   :ensure t
;;   :demand t
;;   :bind*
;;   (("C-z" . modalka-mode))
;;   :diminish (modalka-mode . "μ")
;;   :init
;;   (setq modalka-cursor-type 'box)
;;   :config
;;   (global-set-key (kbd "<escape>") #'modalka-mode)
;;   (modalka-global-mode 1)
;;   (add-to-list 'modalka-excluded-modes 'magit-status-mode)
;;   (add-to-list 'modalka-excluded-modes 'magit-popup-mode)
;;   (add-to-list 'modalka-excluded-modes 'eshell-mode)
;;   (add-to-list 'modalka-excluded-modes 'deft-mode)
;;   (add-to-list 'modalka-excluded-modes 'term-mode))

;; (modalka-define-kbd "W" "M-w")
;; (modalka-define-kbd "Y" "M-y")
;; (modalka-define-kbd "a" "C-a")
;; (modalka-define-kbd "b" "C-b")
;; (modalka-define-kbd "e" "C-e")
;; (modalka-define-kbd "f" "C-f")
;; (modalka-define-kbd "g" "C-g")
;; (modalka-define-kbd "n" "C-n")
;; (modalka-define-kbd "p" "C-p")
;; (modalka-define-kbd "w" "C-w")
;; (modalka-define-kbd "y" "C-y")
;; (modalka-define-kbd "SPC" "C-SPC")

(provide 'modules-evil)
