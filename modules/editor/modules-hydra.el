;; Hydra docs https://github.com/abo-abo/hydra/wiki/
;; https://oremacs.com/2015/02/02/colorful-hydrae/
;; https://oremacs.com/2015/07/20/hydra-columns/
;; https://github.com/otijhuis/emacs.d/blob/master/config/hydra-settings.el
;; https://www.reddit.com/r/emacs/comments/b1trp7/hydra_showcase_anyone/
;; https://ladicle.com/post/config/#which-key

(use-package hydra
  :straight t
  :preface

  (defun toggle-maximize-buffer () "Maximize buffer"
		 (interactive)
		 (if (= 1 (length (window-list)))
			 (jump-to-register '_)
		   (progn
			 (window-configuration-to-register '_)
			 (delete-other-windows))))

  (require 'windmove)
  (require 'winner)

  (defun ace-maximize-window ()
    "Ace maximize window."
    (interactive)
    (select-window (aw-select " Ace - Maximize Window"))
    (delete-other-windows))

  (defun hydra-move-splitter-left (arg)
    "Move window splitter left."
    (interactive "p")
    (if (let ((windmove-wrap-around))
	  (windmove-find-other-window 'right))
	(shrink-window-horizontally arg)
      (enlarge-window-horizontally arg)))

  (defun hydra-move-splitter-right (arg)
    "Move window splitter right."
    (interactive "p")
    (if (let ((windmove-wrap-around))
	  (windmove-find-other-window 'right))
	(enlarge-window-horizontally arg)
      (shrink-window-horizontally arg)))

  (defun hydra-move-splitter-up (arg)
    "Move window splitter up."
    (interactive "p")
    (if (let ((windmove-wrap-around))
	  (windmove-find-other-window 'up))
	(enlarge-window arg)
      (shrink-window arg)))

  (defun hydra-move-splitter-down (arg)
    "Move window splitter down."
    (interactive "p")
    (if (let ((windmove-wrap-around))
	  (windmove-find-other-window 'up))
	(shrink-window arg)
      (enlarge-window arg)))

  (defvar rectangle-mark-mode)
  (defun hydra-ex-point-mark ()
    "Exchange point and mark."
    (interactive)
    (if rectangle-mark-mode
	(rectangle-exchange-point-and-mark)
      (let ((mk (mark)))
	(rectangle-mark-mode 1)
	(goto-char mk))))

  :config
  (defhydra hydra-zoom (:color "#1098F7")
    "zoom"
    ("=" text-scale-increase "in")
    ("-" text-scale-decrease "out")
    ("0" text-scale-adjust "adjust")
    ("q" nil "quit"))

  (defhydra hydra-workspace (:color "#1098F7")
    "counsel"
    ("1" eyebrowse-switch-to-window-config-1 "Workspace 1")
    ("2" eyebrowse-switch-to-window-config-2 "Workspace 2")
    ("3" eyebrowse-switch-to-window-config-3 "Workspace 3")
    ("4" eyebrowse-switch-to-window-config-4 "Workspace 4")
    ("5" eyebrowse-switch-to-window-config-5 "Workspace 5")
    ("6" eyebrowse-switch-to-window-config-6 "Workspace 6")
    ("7" eyebrowse-switch-to-window-config-7 "Workspace 7")
    ("8" eyebrowse-switch-to-window-config-8 "Workspace 8")
    ("9" eyebrowse-switch-to-window-config-9 "Workspace 9")
    ("]" eyebrowse-next-window-config "Next Workspace")
    ("[" eyebrowse-prev-window-config "Previous Workspace")
    ("s" eyebrowse-switch-to-window-config "Switch Workspaces")
    ("r" eyebrowse-rename-window-config "Rename Workspace")
    ("l" eyebrowse-last-window-config "Last Workspace")
    ("d" eyebrowse-close-window-config "Delete Workspace")
    ("c" eyebrowse-create-window-config "Create Workspace")
    ("q" nil "quit"))

  (defhydra hydra-mpd (:color "#1098F7")
    "mpd"
    ("." libmpdel-playback-next "next")
    ("," libmpdel-playback-previous "prev")
    ("/" libmpdel-playback-play-pause "toggle")
    ("'" libmpdel-playback-stop "stop")
    ("-" mpdel-core-volume-decrease"increase")
    ("=" mpdel-core-volume-increase "decrease"))

  (defhydra hydra-windows (:color "#1098F7")
    ("h" windmove-left "left")
    ("j" windmove-down "down")
    ("k" windmove-up "up")
    ("l" windmove-right "right")
    ("H" hydra-move-splitter-left "increase left")
    ("J" hydra-move-splitter-down "increase down")
    ("K" hydra-move-splitter-up "increase up")
    ("L" hydra-move-splitter-right "increase right")
    ("b" switch-to-buffer "switch buffer")
    ("f" counsel-find-file "find file")
    ("F" follow-mode "follow")
    ("a" (lambda ()
	   (interactive)
	   (ace-window 1)
	   (add-hook 'ace-window-end-once-hook
		     'hydra-window/body))
     "ace-window")
    ("v" (lambda ()
	   (interactive)
	   (split-window-right)
	   (windmove-right))
     "vertical split")
    ("s" (lambda ()
	   (interactive)
	   (split-window-below)
	   (windmove-down))
     "horizontal split")
    ("S" (lambda ()
	   (interactive)
	   (ace-window 4)
	   (add-hook 'ace-window-end-once-hook
		     'hydra-windows/body)) "swap")
    ("w" save-buffer "save")
    ("c" delete-window "delete")
    ("C" (lambda ()
	   (interactive)
	   (ace-window 16)
	   (add-hook 'ace-window-end-once-hook
		     'hydra-windows/body))
     "ace-delete")
    ("o" delete-other-windows "delete others")
    ("M" ace-maximize-window "ace-maximize")
    ("m" toggle-maximize-buffer "toggle maximize")
    ("t" multi-vterm "vterm")
    ("d" counsel-dired "dired")
    ("u" (progn
	   (winner-undo)
	   (setq this-command 'winner-undo)) "undo")
    ("r" winner-redo "redo")
    ("q" nil "quit"))

  (general-define-key
   :prefix "C-c"
   "z" 'hydra-zoom/body
   "w" 'hydra-workspace/body
   "o" 'hydra-windows/body
   "d" 'hydra-mpd/body)

  ;; (defhydra hydra-buffer (global-map "C-c b")
  ;;   "Buffer"
  ;;   ("b" ibuffer "ibuffer")
  ;;   ("B" counsel-ibuffer "counsel-ibuffer")
  ;;   ("s" switch-to-buffer "switch")
  ;;   ("S" counsel-switch-buffer "counsel-switch")
  ;;   ("k" kill-buffer "kill buffer")
  ;;   ("K" kill-this-buffer "kill this buffer")
  ;;   ("r" revert-buffer "revert buffer")
  ;;   )

  ;; (defhydra hydra-projectile-other-window (global-map "C-c C-b ":color teal)
  ;; (defhydra hydra-projectile-other-window (:color teal)
  ;;   "projectile-other-window"
  ;;   ("f"  projectile-find-file-other-window        "file")
  ;;   ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ;;   ("d"  projectile-find-dir-other-window         "dir")
  ;;   ("b"  projectile-switch-to-buffer-other-window "buffer")
  ;;   ("q"  nil                                      "cancel" :color blue))

  ;; ;; (defhydra hydra-projectile (:color blue)
  ;; (defhydra hydra-projectile (global-map "C-c C-p")
  ;;   "
  ;; ^
  ;; ^Projectile^        ^Buffers^           ^Find^              ^Search^
  ;; ^──────────^────────^───────^───────────^────^──────────────^──────^────────────
  ;; _q_ quit            _b_ list            _d_ directory       _r_ replace
  ;; _i_ reset cache     _k_ kill all        _D_ root            _R_ regexp replace
  ;; ^^                  _S_ save all        _f_ file            _s_ search
  ;; ^^                  ^^                  _p_ project         ^^
  ;; ^^                  ^^                  ^^                  ^^
  ;; "
  ;;   ("q" nil)
  ;;   ("b" counsel-projectile-switch-to-buffer)
  ;;   ("d" counsel-projectile-find-dir)
  ;;   ("D" projectile-dired)
  ;;   ("f" counsel-projectile-find-file)
  ;;   ("i" projectile-invalidate-cache :color red)
  ;;   ("k" projectile-kill-buffers)
  ;;   ("p" counsel-projectile-switch-project)
  ;;   ("r" projectile-replace)
  ;;   ("R" projectile-replace-regexp)
  ;;   ("s" counsel-rg)
  ;;   ("S" projectile-save-project-buffers))

  ;; (defhydra hydra-projectile (global-map "C-c C-b" :color teal
				     ;; :hint nil)
;;   (defhydra hydra-projectile (global-map "C-c C-p")
;;     "
;;      PROJECTILE: %(projectile-project-root)

;;      Find File            Search/Tags          Buffers                Cache
;; ------------------------------------------------------------------------------------------
;; _s-f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
;;  _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
;;  _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
;;   _r_: recent file                                               ^^^^_z_: cache current
;;   _d_: dir

;; "
;;     ("a"   projectile-ag)
;;     ("b"   projectile-switch-to-buffer)
;;     ("c"   projectile-invalidate-cache)
;;     ("d"   projectile-find-dir)
;;     ("s-f" projectile-find-file)
;;     ("ff"  projectile-find-file-dwim)
;;     ("fd"  projectile-find-file-in-directory)
;;     ("g"   ggtags-update-tags)
;;     ("s-g" ggtags-update-tags)
;;     ("i"   projectile-ibuffer)
;;     ("K"   projectile-kill-buffers)
;;     ("s-k" projectile-kill-buffers)
;;     ("m"   projectile-multi-occur)
;;     ("o"   projectile-multi-occur)
;;     ("s-p" projectile-switch-project "switch project")
;;     ("p"   projectile-switch-project)
;;     ("s"   projectile-switch-project)
;;     ("r"   projectile-recentf)
;;     ("x"   projectile-remove-known-project)
;;     ("X"   projectile-cleanup-known-projects)
;;     ("z"   projectile-cache-current-file)
;;     ("`"   hydra-projectile-other-window/body "other window")
;;     ("q"   nil "cancel" :color blue))

  ;; (defhydra hydra-project (global-map "C-c C-p")
  ;;   "counsel"
  ;;   ("p" counsel-fzf "counsel-fzf")
  ;;   ("r" counsel-rg "counsel-rg")
  ;;   ("l" counsel-locate "counsel-locate")
  ;;   ("f" counsel-file-jump "counsel-file-jump")
  ;;   ("g" counsel-git "counsel-git")
  ;;   ("e" counsel-git-grep "counsel-git-grep"))


  ;; General+which
  ;; (defhydra hydra-counsel (global-map "C-c o")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "counsel-fzf")
  ;;   ("r" counsel-rg "counsel-rg")
  ;;   ("l" counsel-locate "counsel-locate")
  ;;   ("f" counsel-file-jump "counsel-file-jump")
  ;;   ("g" counsel-git "counsel-git")
  ;;   ("e" counsel-git-grep "counsel-git-grep"))

  ;; General+which
  ;; (defhydra hydra-calendar (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-complete (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; Emacs windows
  ;; (defhydra hydra-emacs-windows (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-frames (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )


  ;; (defhydra hydra-abbrev (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-register (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; Replace workspace
  ;; (defhydra hydra-tabs (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-narrow (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-insert-todo (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-format (global-map "C-c k")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-org-launch (global-map "C-c a")
  ;;   "org-launch"
  ;;   ("a" org-agenda)
  ;;   ("c" org-capture)
  ;;   )

  ;; (defhydra hydra-org-todo (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-org-roam (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-bookmark (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )


  ;; General+which
  ;; (defhydra hydra-project (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;;  ;; Iedit/mc/etc
  ;; (defhydra hydra-multi-cursor (global-map "C-c m c")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-help (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-info (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-tramp (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-macro (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-language (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-magit (global-map "C-c g")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-treemacs (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-prose (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-calc (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; Anzu/Avy/Replace/goto/Swiper etc or maybe separate "goto"?
  ;; (defhydra hydra-search (global-map "C-c s")
  ;;   "counsel"
  ;;   ("s" swiper-isearch "isearch")
  ;;   ("f" isearch-forward "isearch")
  ;;   ("F" isearch-regexp "isearch-regexp")
  ;;   ("b" isearch-backward "isearch-backward")
  ;;   ("B" isearch-backward-regexp "isearch-backward-regexp")
  ;;   ("l" goto-line "goto-line")
  ;;   ("SPC" avy-goto-word-or-subword-1 "avy-goto-word-or-subword-1")
  ;;   ("al" avy-goto-line "avy-goto-line")
  ;;   ("ac" avy-goto-char "avy-goto-char")
  ;;   ("aC" avy-goto-char-2 "avy-goto-char-2")
  ;;   ("aw" avy-goto-word-0 "avy-goto-word-0")
  ;;   ("aW" avy-goto-word-1 "avy-goto-word-1"))

  ;; (defhydra hydra-mail (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-compile (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-numbers (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-evil (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-irc (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-inserts (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-theme (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-theme (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; ;; hydra modal
  ;; (defhydra hydra-case (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-copy-paste (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; (defhydra hydra-transpose (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; ;; for C-x 8
  ;; ;; (defhydra hydra-translate (global-map "C-c x")
  ;; ;;   "counsel"
  ;; ;;   ("z" counsel-fzf "in")
  ;; ;;   ("-" text-scale-decrease "out")
  ;; ;;   )


  ;; General+which
  ;; (defhydra hydra-lsp (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; General+which
  ;; ;; for website etc
  ;; (defhydra hydra-launch (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-web (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )

  ;; (defhydra hydra-diff (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out")
  ;;   )


  ;; (defhydra hydra-delim (global-map "C-c x")
  ;;   "counsel"
  ;;   ("z" counsel-fzf "in")
  ;;   ("-" text-scale-decrease "out"))
  )


;; (use-package hydra-posframe
;;   :load-path "~/.config/emacs/hydra-posframe"
;;   :custom
;;   (hydra-posframe-parameters
;;    '((left-fringe . 5)
;;      (right-fringe . 5)))
;;   :custom-face
;;   (hydra-posframe-border-face ((t (:background "#6272a4"))))
;;   :hook (after-init . hydra-posframe-enable))


(provide 'modules-hydra)
