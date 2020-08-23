;; https://karthinks.com/blog/lazy-elfeed/
;; https://noonker.github.io/posts/2020-04-22-elfeed/
;; https://gist.github.com/alphapapa/80d2dba33fafcb50f558464a3a73af9a
;; https://www.reddit.com/r/emacs/comments/hq3r36/elfeed_configuration_to_display_in_next_window/
;; http://pragmaticemacs.com/category/elfeed/
;; https://www.reddit.com/r/emacs/comments/5z2s75/take_elfeed_everywhere_mobile_rss_reading/
;; https://punchagan.muse-amuse.in/blog/elfeed-hook-to-fetch-full-content/
;; https://nullprogram.com/blog/2015/12/03/
;; https://github.com/remyhonig/elfeed-org
;; https://github.com/skeeto/elfeed/issues/222
;; https://www.reddit.com/r/emacs/comments/5z2s75/take_elfeed_everywhere_mobile_rss_reading/

(use-package elfeed
  :straight t
  :preface
  (defun bjm/elfeed-show-all ()
    (interactive)
    (bookmark-maybe-load-default-file)
    (bookmark-jump "elfeed-all"))
  (defun bjm/elfeed-show-emacs ()
    (interactive)
    (bookmark-maybe-load-default-file)
    (bookmark-jump "elfeed-emacs"))
  (defun bjm/elfeed-show-daily ()
    (interactive)
    (bookmark-maybe-load-default-file)
    (bookmark-jump "elfeed-daily"))
  (defun bjm/elfeed-load-db-and-open ()
    "Wrapper to load the elfeed db from disk before opening"
    (interactive)
    (elfeed-db-load)
    (elfeed)
    (elfeed-search-update--force))

  ;;insert space before elfeed filter
  (defun bjm/elfeed-search-live-filter-space ()
    "Insert space when running elfeed filter"
    (interactive)
    (let ((elfeed-search-filter (concat elfeed-search-filter " ")))
      (elfeed-search-live-filter)))

  ;;write to disk when quiting
  (defun bjm/elfeed-save-db-and-bury ()
    "Wrapper to save the elfeed db to disk before burying buffer"
    (interactive)
    (elfeed-db-save)
    (quit-window))
  :bind ((:map elfeed-search-mode-map
	       ("A" . bjm/elfeed-show-all)
	       ("E" . bjm/elfeed-show-emacs)
	       ("D" . bjm/elfeed-show-daily)
	       ("/" . bjm/elfeed-search-live-filter-space)
	       ("q" . bjm/elfeed-save-db-and-bury)))
  :config
  (defun bjm/elfeed-star ()
    "Apply starred to all selected entries."
    (interactive )
    (let* ((entries (elfeed-search-selected))
	   (tag (intern "starred")))

      (cl-loop for entry in entries do (elfeed-tag entry tag))
      (mapc #'elfeed-search-update-entry entries)
      (unless (use-region-p) (forward-line))))

  ;; remove a start
  (defun bjm/elfeed-unstar ()
    "Remove starred tag from all selected entries."
    (interactive )
    (let* ((entries (elfeed-search-selected))
	   (tag (intern "starred")))

      (cl-loop for entry in entries do (elfeed-untag entry tag))
      (mapc #'elfeed-search-update-entry entries)
      (unless (use-region-p) (forward-line))))

  ;; face for starred articles
  (defface elfeed-search-starred-title-face
    '((t :foreground "#f77"))
    "Marks a starred Elfeed entry.")

  (push '(starred elfeed-search-starred-title-face) elfeed-search-face-alist)

  (defun elfeed-eww-open (&optional use-generic-p)
    "open with eww"
    (interactive "P")
    (let ((entries (elfeed-search-selected)))
      (cl-loop for entry in entries
	       do (elfeed-untag entry 'unread)
	       when (elfeed-entry-link entry)
	       do (eww-browse-url it))
      (mapc #'elfeed-search-update-entry entries)
      (unless (use-region-p) (forward-line))))

  (defun elfeed-firefox-open (&optional use-generic-p)
    "open with firefox"
    (interactive "P")
    (let ((entries (elfeed-search-selected)))
      (cl-loop for entry in entries
	       do (elfeed-untag entry 'unread)
	       when (elfeed-entry-link entry)
	       do (browse-url-firefox it))
      (mapc #'elfeed-search-update-entry entries)
      (unless (use-region-p) (forward-line))))

  (defun elfeed-w3m-open (&optional use-generic-p)
    "open with w3m"
    (interactive "P")
    (let ((entries (elfeed-search-selected)))
      (cl-loop for entry in entries
	       do (elfeed-untag entry 'unread)
	       when (elfeed-entry-link entry)
	       do (ffap-w3m-other-window it))
      (mapc #'elfeed-search-update-entry entries)
      (unless (use-region-p) (forward-line))))

  (defalias 'elfeed-toggle-star
    (elfeed-expose #'elfeed-search-toggle-all 'starred))

  (eval-after-load 'elfeed-search
    '(define-key elfeed-search-mode-map (kbd "m") 'elfeed-toggle-star))

  (defun bjm/elfeed-show-starred ()
    (interactive)
    (bookmark-jump "elfeed-starred"))
  (define-key elfeed-search-mode-map (kbd "T") 'bjm/elfeed-show-starred)

  (setf url-queue-timeout 30)
  (eval-after-load 'elfeed-search
    '(define-key elfeed-search-mode-map (kbd "*") 'bjm/elfeed-star))
  (eval-after-load 'elfeed-search
    '(define-key elfeed-search-mode-map (kbd "8") 'bjm/elfeed-unstar))

  (define-key elfeed-search-mode-map "t" 'elfeed-search-toggle-all)
  (define-key elfeed-search-mode-map (kbd "B") 'elfeed-eww-open)
  (define-key elfeed-search-mode-map (kbd "F") 'elfeed-firefox-open)
  (define-key elfeed-search-mode-map (kbd "W") 'elfeed-w3m-open))

(use-package elfeed-org
  :straight t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.config/emacs/modules/applications/elfeed.org")))

(provide 'modules-elfeed)
