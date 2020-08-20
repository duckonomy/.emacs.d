(use-package autorevert
  :ensure nil
  :init
  (global-auto-revert-mode 1)
  :hook
  (dired-mode . auto-revert-mode)
  :config
  (setq auto-revert-verbose nil)
  (setq auto-revert-avoid-polling t)
  )

;; (setq auto-save-timeout 99999)
;; ;; Set up my timer
;; (defvar bjm/auto-save-timer nil
;;   "Timer to run `bjm/auto-save-silent'")

;; ;; Auto-save every 5 seconds of idle time
;; (defvar bjm/auto-save-interval 5
;;   "How often in seconds of idle time to auto-save with `bjm/auto-save-silent'")

;; ;; Function to auto save files silently
;; (defun bjm/auto-save-silent ()
;;   "Auto-save all buffers silently"
;;   (interactive)
;;   (do-auto-save t))

;; ;; Start new timer
;; (setq bjm/auto-save-timer
;;       (run-with-idle-timer 0 bjm/auto-save-interval 'bjm/auto-save-silent))


(provide 'core-auto-revert)
