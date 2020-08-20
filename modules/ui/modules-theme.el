(use-package theme
  :ensure nil
  :defer t
  :load-path
  "themes"
  :preface

  (defun load-light-theme ()
	(interactive)
	(load-theme 'berrys t))

  (defun load-dark-theme ()
	(interactive)
	(load-theme 'berrys-dark t))

  (defun load-gruv-theme ()
	(interactive)
	(load-theme 'doom-gruvbox t))


  (defun load-gray-theme ()
	(interactive)
	(load-theme 'grayscale-theme t))

  :init
  (add-to-list 'custom-theme-load-path "~/.config/emacs/modules/ui/themes/berrys-dark-theme")
  (add-to-list 'custom-theme-load-path "~/.config/emacs/modules/ui/themes/berrys-theme")
  ;; (add-to-list 'custom-theme-load-path "~/.config/emacs/modules/ui/themes/doom-themes")
  (add-to-list 'custom-theme-load-path "~/.config/emacs/modules/ui/themes/emacs-grayscale-theme")
  (load-light-theme)
  )
;; (defgroup elegance nil
;;   "Faces for the elegance theme"
;;   :prefix "face-")
;; (defface face-subtle nil
;; "Subtle face is used to suggest a physical area on the screen.
;; It is important to not disturb too strongly the reading of
;; information and this can be made by setting a very light
;; background color that is barely perceptible."
;; :group 'elegance)


;; (defface face-critical nil
;; "Critical face is for information that requires immediate action.
;; It should be of high constrast when compared to other faces. This
;; can be realized (for example) by setting an intense background
;; color, typically a shade of red. It must be used scarcely."
;; :group 'elegance)

;; (defface face-popout nil
;; "Popout face is used for information that needs attention.
;; To achieve such effect, the hue of the face has to be
;; sufficiently different from other faces such that it attracts
;; attention through the popout effect."
;; :group 'elegance)

;; (defface face-strong nil
;; "Strong face is used for information of a structural nature.
;; It has to be the same color as the default color and only the
;; weight differs by one level (e.g., light/regular or
;; regular/bold). IT is generally used for titles, keywords,
;; directory, etc."
;; :group 'elegance)

;; (defface face-salient nil
;; "Salient face is used for information that are important.
;; To suggest the information is of the same nature but important,
;; the face uses a different hue with approximately the same
;; intensity as the default face. This is typically used for links."

;; :group 'elegance)

;; (defface face-faded nil
;; "Faded face is for information that are less important.
;; It is made by using the same hue as the default but with a lesser
;; intensity than the default. It can be used for comments,
;; secondary information and also replace italic (which is generally
;; abused anyway)."
;; :group 'elegance)
;; (defun set-face (face style)
;;   "Reset a face and make it inherit style."
;;   (set-face-attribute face nil
;;    :foreground 'unspecified :background 'unspecified
;;    :family     'unspecified :slant      'unspecified
;;    :weight     'unspecified :height     'unspecified
;;    :underline  'unspecified :overline   'unspecified
;;    :box        'unspecified :inherit    style))

;; (define-key mode-line-major-mode-keymap [header-line]
;;   (lookup-key mode-line-major-mode-keymap [mode-line]))

;; (defun mode-line-render (left right)
;;   (let* ((available-width (- (window-width) (length left) )))
;;	(format (format "%%s %%%ds" available-width) left right)))
;; (setq-default mode-line-format
;;	 '((:eval
;;	   (mode-line-render
;;	   (format-mode-line (list
;;		 (propertize "☰" 'face `(:inherit mode-line-buffer-id)
;;						 'help-echo "Mode(s) menu"
;;						 'mouse-face 'mode-line-highlight
;;						 'local-map   mode-line-major-mode-keymap)
;;		 " %b "
;;		 (if (and buffer-file-name (buffer-modified-p))
;;			 (propertize "(modified)" 'face `(:inherit face-faded)))))
;;	   (format-mode-line
;;		(propertize "%4l:%2c  " 'face `(:inherit face-faded)))))))


;; ;; Comment if you want to keep the modeline at the bottom
;; (setq-default header-line-format mode-line-format)
;; (setq-default mode-line-format'(""))


;; ;; Vertical window divider
;; (setq window-divider-default-right-width 3)
;; (setq window-divider-default-places 'right-only)
;; (window-divider-mode)


;; (defun set-modeline-faces ()

;;   ;; Mode line at top
;;   (set-face-attribute 'header-line                                 'face-strong)
;;   (set-face-attribute 'header-line nil
;;								:underline (face-foreground 'default))
;;   (set-face-attribute 'mode-line nil
;;					  :height 10
;;					  :underline (face-foreground 'default)
;;					  :overline nil
;;					  :box nil
;;					  :foreground (face-background 'default)
;;					  :background (face-background 'default))
;;   (set-face-attribute 'mode-line-inactive                            'mode-line)

;;   ;; Mode line at bottom
;;   ;; (set-face 'header-line                                 'face-strong)
;;   ;; (set-face-attribute 'mode-line nil
;;   ;;                     :height 1.0
;;   ;;                     :overline (face-background 'default)
;;   ;;                     :underline nil
;;   ;;                     :foreground (face-foreground 'default)
;;   ;;                     :background (face-background 'face-subtle)
;;   ;;                     :box `(:line-width 2
;;   ;;                            :color ,(face-background 'face-subtle)
;;   ;;                            :style nil))
;;   ;; (set-face 'mode-line-highlight '(face-popout mode-line))
;;   ;; (set-face 'mode-line-emphasis  'face-strong)
;;   ;; (set-face-attribute 'mode-line-buffer-id nil :weight 'regular)
;;   ;; (set-face-attribute 'mode-line-inactive nil
;;   ;;                     :height 1.0
;;   ;;                     :overline (face-background 'default)
;;   ;;                     :underline nil
;;   ;;                     :foreground (face-foreground 'face-faded)
;;   ;;                     :background (face-background 'face-subtle)
;;   ;;                     :box `(:line-width 2
;;   ;;                            :color ,(face-background 'face-subtle)
;;   ;;                            :style nil))


;;   (set-face-attribute 'cursor nil
;;					  :background (face-foreground 'default))
;;   (set-face-attribute 'window-divider nil
;;					  :foreground (face-background 'mode-line))
;;   (set-face-attribute 'window-divider-first-pixel nil
;;					  :foreground (face-background 'default))
;;   (set-face-attribute 'window-divider-last-pixel nil
;;					  :foreground (face-background 'default))
;;   )
;; (defun set-button-faces ()
;;   (set-face-attribute 'custom-button nil
;;					  :foreground (face-foreground 'face-faded)
;;					  :background (face-background 'face-subtle)
;;					  :box `(:line-width 1
;;							 :color ,(face-foreground 'face-faded)
;;							 :style nil))
;;   (set-face-attribute 'custom-button-mouse nil
;;					  :foreground (face-foreground 'default)
;;					  ;; :background (face-foreground 'face-faded)
;;					  :inherit 'custom-button
;;					  :box `(:line-width 1
;;							 :color ,(face-foreground 'face-subtle)
;;							 :style nil))
;;   (set-face-attribute 'custom-button-pressed nil
;;					  :foreground (face-background 'default)
;;					  :background (face-foreground 'face-salient)
;;					  :inherit 'face-salient
;;					  :box `(:line-width 1
;;							 :color ,(face-foreground 'face-salient)
;;							 :style nil)
;;					  :inverse-video nil))
;;	(setq frame-background-mode 'light)
;;	;; (set-background-color "#ffffff")
;;	;; (set-foreground-color "#333333")
;;	(set-face-attribute 'default nil
;;						:foreground (face-foreground 'default)
;;						:background (face-background 'default))
;;	(set-face-attribute 'face-critical nil :foreground "#ffffff"
;;										   :background "#ff6347")
;;	(set-face-attribute 'face-popout nil :foreground "#ffa07a")
;;	(set-face-attribute 'face-strong nil :foreground "#333333"
;;										 :weight 'regular)
;;	(set-face-attribute 'face-salient nil :foreground "#00008b"
;;										  :weight 'light)
;;	(set-face-attribute 'face-faded nil :foreground "#999999"
;;										:weight 'light)
;;	(set-face-attribute 'face-subtle nil :background "#f0f0f0")

;;	(set-modeline-faces)

;;	(with-eval-after-load 'cus-edit (set-button-faces))

; )

(provide 'modules-theme)
