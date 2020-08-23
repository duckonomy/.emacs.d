(use-package flymake
  :general
  (:keymaps flymake-mode-map
	    "M-n" 'flymake-goto-next-error
	    "M-p" 'flymake-goto-prev-error))

(use-package flymake-diagnostic-at-point
  :disabled
  :straight t
  :after flymake
  :config
  (setq flymake-diagnostic-at-point-timer-delay 0.1)
  ;; (setq flymake-diagnostic-at-point-error-prefix " ")
  (setq flymake-diagnostic-at-point-display-diagnostic-function 'flymake-diagnostic-at-point-display-popup) ;; or flymake-diagnostic-at-point-display-minibuffer
  (setq flymake-start-on-save-buffer t)
  :hook
  (flymake-mode . flymake-diagnostic-at-point-mode))

;; (use-package posframe
;;   :straight t
;; )

;; (use-package flymake-posframe
;;   :disabled
;;   :load-path
;;   "~/.config/emacs/lib/flymake-posframe"
;;   :hook
;;   (flymake-mode . flymake-posframe-mode))

(provide 'modules-flymake)
