(use-package faces
  :straight (:type built-in)
  :preface
  (defvar duckonomy/font "Sarasa Mono K"
    "Main font")

  (defvar duckonomy/font-vp "Noto Sans"
    "Variable pitch font")

  (defvar duckonomy/font-kr "Sarasa Mono K"
    "Korean font")

  (defvar duckonomy/font-ch "Sarasa Mono C"
    "Chinese font")

  (defvar duckonomy/font-ja "Sarasa Mono J"
    "Japanese font")

  (defvar duckonomy/font-fallback "Courier New"
    "Fallback font")

  (defun duckonomy/use-font (&optional frame)
    "Set fonts with this."
    (when frame
      (select-frame frame))

    (set-face-attribute 'default nil
			:weight 'normal
			:height 150
			:slant 'normal
			:family duckonomy/font)

    (set-face-attribute 'fixed-pitch nil
			:weight 'normal
			:height 1.0
			:slant 'normal
			:family duckonomy/font)

    (set-face-attribute 'variable-pitch nil
			:weight 'light
			:height 1.2
			:slant 'normal
			:family duckonomy/font-vp)

    (set-fontset-font t 'hangul
		      (font-spec
		       :name duckonomy/font-kr
		       :weight 'normal))

    (set-fontset-font t 'chinese-gbk
		      (font-spec
		       :family duckonomy/font-ch
		       :weight 'normal))

    (set-fontset-font t 'japanese-jisx0213.2004-1
		      (font-spec
		       :family duckonomy/font-ja
		       :weight 'normal))

    (dolist (face '(font-lock-comment-delimiter-face
		    font-lock-comment-face))
      (set-face-attribute face nil :slant 'italic :weight 'medium)))

  (defun set-buffer-variable-pitch ()
    "Configurations that come with variable pitch."
    (interactive)
    (setq line-spacing 5)
    (variable-pitch-mode t))
  :init
  (if (daemonp)
      (progn
	(add-hook 'after-make-frame-functions
		  (lambda (frame)
		    (with-selected-frame frame
		      (duckonomy/use-font)))))
    (duckonomy/use-font))
  :hook
  (((org-mode eww-mode markdown-mode Info-mode) . set-buffer-variable-pitch))
  ;; :config
  ;; (setq global-font-lock-mode t)
  )

(provide 'modules-faces)
