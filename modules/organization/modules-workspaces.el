;; (use-package eyebrowse                  ; Easy workspaces creation and switching
;;   :ensure t
;;   :config
;;   (validate-setq eyebrowse-mode-line-separator " "
;;				 eyebrowse-new-workspace t)

;;   (eyebrowse-mode t))

(use-package eyebrowse                  ; Easy workspaces creation and switching
  :ensure t
  :bind
  (:map eyebrowse-mode-map
		("M-1" . eyebrowse-switch-to-window-config-1)
		("M-2" . eyebrowse-switch-to-window-config-2)
		("M-3" . eyebrowse-switch-to-window-config-3)
		("M-4" . eyebrowse-switch-to-window-config-4))
  :config
  (setq eyebrowse-mode-line-separator " ")
  (setq eyebrowse-new-workspace t)
  (setq eyebrowse-mode-line-style 'current)
  (eyebrowse-mode t))

(provide 'modules-workspaces)
