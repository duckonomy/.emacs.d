;; No need for Emacs 27 >
; (use-package web-mode
;   :straight t)

(use-package rainbow-mode
  :straight t
  :hook
  ((css-mode html-mode sass-mode) . rainbow-mode))

; Make work with tab
(use-package emmet-mode
  :straight t
  :config
  (setq emmet-expand-jsx-className? t)
  (setq emmet-self-closing-tag-style " /")
  :hook
  ((sgml-mode . emmet-mode)
   (css-mode . emmet-mode)
   (js-jsx-mode . emmet-mode)
   (js-mode . emmet-mode)
   (js2-jsx-mode . emmet-mode)))

(provide 'modules-web)
