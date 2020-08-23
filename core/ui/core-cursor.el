(use-package cursor
  :defer t
  :init
  (blink-cursor-mode -1)
  :config
  ;; (setq visible-cursor nil "get rid of cursor blink in console")
  ;; (setq cursor-in-non-selected-windows nil "Keep cursors and highlights in current window only")
  ;; (setq x-stretch-cursor t "Draw the block cursor as wide as the glyph under it. (i.e. tabs)")
  (setq visible-cursor nil)
  (setq cursor-in-non-selected-windows nil)
  (setq x-stretch-cursor t))

(provide 'core-cursor)
