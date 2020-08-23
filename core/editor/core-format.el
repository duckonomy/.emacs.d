(use-package format
  :hook
  ((text-mode . (lambda ()
		  (setq truncate-lines nil
			global-visual-line-mode t
			word-wrap t)))
   (prog-mode . (lambda ()
		  (setq truncate-lines t
			global-visual-line-mode nil

			word-wrap nil)))))

;; (add-hook 'text-mode-hook (lambda ()
;;			    (setq truncate-lines nil
;;				  global-visual-line-mode t
;;				  word-wrap t)))

;; (add-hook 'prog-mode-hook (lambda ()
;;			    (setq truncate-lines t
;;				  global-visual-line-mode nil
;;				  word-wrap nil)))

(use-package indentation
  :defer t
  :preface
  (defvar evil-shift-width 4)
  ;; :init
  ;; (electric-indent-mode +1)
  :config
  (setq tab-width 4)
  (setq-default c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq-default javascript-indent-level 2) ; javascript-mode
  (setq-default js-indent-level 2) ; js-mode
  (setq-default js2-basic-offset 2)
  (setq-default web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq-default web-mode-css-indent-offset 2) ; web-mode, css in html file
  (setq-default web-mode-code-indent-offset 2) ; web-mode, js code in html file
  (setq-default css-indent-offset 2) ; css-mode
  (setq-default typescript-indent-level 2) ; css-mode
  (setq-default indent-tabs-mode t)
  ;; (backward-delete-char-untabify-method 'all)
  (setq backward-delete-char-untabify-method 'hungry)
  )

(use-package visual-fill-column
  :straight t
  :config
  ;; (split-window-preferred-function 'visual-line-mode-split-window-sensibly)
  (setq visual-fill-column-center-text nil)
  (setq visual-fill-column-width fill-column)
  )

(provide 'core-format)
