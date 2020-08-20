;;; berrys-dark-theme.el --- A light, clean and elegant theme -*- lexical-binding: t; -*-

;; Copyright © 2019-present Slava Buzin

;; Title: Berrys Theme
;; Project: berrys-dark-theme
;; Version: 0.1.0
;; Package-Version: 20191201.1609
;; Package-Commit: 888a14206b2fb3dc45b5273aeb05075f3e0b5f60
;; URL: https://github.com/vbuzin/berrys-dark-theme
;; Author: Slava Buzin <v8v.buzin@gmail.com>
;; Package-Requires: ((emacs "24.1"))
;; License: MIT

;;; Commentary:

;; Berrys is a 9 colorspace theme build to run in GUI mode
;; with support for some third-party syntax- and UI packages.

;;; Code:

(deftheme berrys-dark "A light, clean and elegant theme")

;;;; Colors
(let* ((class '((class color) (min-colors 89)))
       (berrys-dark00       nil)

       (berrys-dark01       "#111111")
       (berrys-dark02       "#efefef")
       (berrys-dark03       "#C4C4C4")
       (berrys-dark04       "#444444")

       (berrys-dark05       "#1098F7")
       (berrys-dark06       "#6A8C99")

       (berrys-dark07       nil)

       (berrys-dark08       "#5DB25D")

       (berrys-dark09       "#D89800")

       (berrys-dark10       "#C35F5D")

       (berrys-dark-highlight  "#435A63")

       (berrys-dark-cursor  berrys-dark05)
       (berrys-dark-comment berrys-dark03)
       (berrys-dark-string  berrys-dark03)

       (berrys-dark-warning berrys-dark09)
       (berrys-dark-error   berrys-dark10))

  (custom-theme-set-faces
   'berrys-dark

   ;;; Core
   ;; =============================================================================
   ;; => Base
   `(bold ((,class (:weight bold))))
   `(bold-italic ((,class (:weight bold :slant italic))))
   `(default ((,class (:foreground ,berrys-dark02 :background ,berrys-dark01))))
   `(error ((,class (:foreground ,berrys-dark-error))))
   `(fixed-pitch-serif ((,class (:family unspecified))))
   `(font-lock-builtin-face ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(font-lock-comment-face ((,class (:foreground ,berrys-dark-comment :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,berrys-dark-comment :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(font-lock-doc-face ((,class (:inherit (font-lock-comment-face)))))
   `(font-lock-function-name-face ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,berrys-dark-string))))
   `(font-lock-type-face ((,class (:foreground ,berrys-dark02 :slant italic))))
   `(font-lock-variable-name-face ((,class (:foreground ,berrys-dark02))))
   `(font-lock-warning-face ((,class (:inherit warning))))
   `(shadow ((,class (:foreground ,berrys-dark03))))
   `(warning ((,class (:foreground ,berrys-dark-warning))))

   ;; => Core UI
   `(cursor ((,class (:background ,berrys-dark-cursor :inverse-video t))))
   `(custom-button ((,class (:background ,berrys-dark05 :foreground ,berrys-dark01))))
   `(custom-variable-tag ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(custom-visibility ((,class (:inherit link))))
   `(diff-added ((,class (:foreground ,berrys-dark08))))
   `(diff-context ((,class (:foreground ,berrys-dark-string))))
   `(diff-file-header ((,class (:inherit diff-header))))
   `(diff-header ((,class (:foreground ,berrys-dark03))))
   `(diff-hunk-header ((,class (:inherit diff-header))))
   `(diff-indicator-added ((,class (:foreground ,berrys-dark08))))
   `(diff-refine-added ((,class (:foreground ,berrys-dark08))))
   `(diff-refine-changed ((,class (:foreground ,berrys-dark09))))
   `(diff-refine-removed ((,class (:foreground ,berrys-dark10))))
   `(diff-removed ((,class (:foreground ,berrys-dark10))))
   `(dired-directory ((,class :foreground ,berrys-dark02 :weight bold)))
   `(header-line ((,class :foreground ,berrys-dark02 :weight bold)))
   `(line-number-current-line ((,class :foreground ,berrys-dark06)))
   `(highlight ((,class (:background ,berrys-dark04))))
   `(hl-line ((,class (:background ,berrys-dark04))))
   `(info-node ((,class (:foreground ,berrys-dark05 :weight bold))))
   `(info-menu-header ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(info-menu-star ((,class (:foreground ,berrys-dark05))))
   `(info-title-4 ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(isearch ((,class (:background ,berrys-dark-highlight :weight bold))))
   `(isearch-fail ((,class (:foreground ,berrys-dark01 :background ,berrys-dark-error))))
   `(lazy-highlight ((,class (:inherit isearch))))
   `(link ((,class (:underline t))))
   `(link-visited ((,class (:underline t))))
   `(match ((,class (:inherit isearch))))

   `(message-cited-text ((,class (:inherit font-lock-comment-face))))
   `(message-header-cc ((,class (:foreground ,berrys-dark-string))))
   `(message-header-name ((,class (:foreground ,berrys-dark-string))))
   `(message-header-newsgroups ((,class (:foreground ,berrys-dark-string :slant italic :weight bold))))
   `(message-header-other ((,class (:foreground ,berrys-dark-string))))
   `(message-header-subject ((,class (:foreground ,berrys-dark-string))))
   `(message-header-to ((,class (:foreground ,berrys-dark-string))))
   `(message-header-xheader ((,class (:foreground ,berrys-dark-string))))
   `(message-mml ((,class (:foreground ,berrys-dark-string))))
   `(message-separator ((,class (:inherit font-lock-comment-face))))

   `(minibuffer-prompt ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(mode-line ((,class (:foreground ,berrys-dark02 :background ,berrys-dark04))))
   `(mode-line-buffer-id ((,class (:weight bold))))
   `(mode-line-highlight ((,class (:inherit highlight))))
   `(mode-line-inactive ((,class (:foreground ,berrys-dark02 :background ,berrys-dark01 :box (:color ,berrys-dark04)))))
   `(outline-1 ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(outline-2 ((,class (:inherit outline-1))))
   `(outline-3 ((,class (:inherit outline-1))))
   `(outline-4 ((,class (:inherit outline-1))))
   `(outline-5 ((,class (:inherit outline-1))))
   `(outline-6 ((,class (:inherit outline-1))))
   `(outline-7 ((,class (:inherit outline-1))))
   `(outline-8 ((,class (:inherit outline-1))))
   `(region ((,class (:background ,berrys-dark06))))
   `(secondary-selection ((,class (:background ,berrys-dark04 :foreground ,berrys-dark02))))
   `(show-paren-match ((,class (:weight bold))))
   `(show-paren-mismatch ((,class (:foreground ,berrys-dark-error :weight bold))))
   `(success ((,class (:foreground ,berrys-dark08))))
   `(whitespace-big-indent ((,class (:foreground ,berrys-dark01 :background ,berrys-dark10))))
   `(whitespace-line ((,class (:background ,berrys-dark01))))
   `(whitespace-trailing ((,class (:foreground ,berrys-dark01 :background ,berrys-dark10))))

   ;;; Packages
   ;; =============================================================================
   ;; => Ace jump
   `(ace-jump-face-foreground ((,class (:foreground ,berrys-dark05 :weight bold))))

   ;; => Anzu
   `(anzu-match-1 ((,class (:foreground ,berrys-dark05 :weight bold :box (:color ,berrys-dark05)))))
   `(anzu-match-2 ((,class (:foreground ,berrys-dark01 :background ,berrys-dark05 :weight bold :box (:color ,berrys-dark05)))))
   `(anzu-match-3 ((,class (:foreground ,berrys-dark01 :background ,berrys-dark03 :weight bold :box (:color ,berrys-dark03)))))
   `(anzu-mode-line ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(anzu-mode-line-no-match ((,class (:foreground ,berrys-dark10 :weight bold))))
   `(anzu-replace-to ((,class (:foreground ,berrys-dark-string :weight bold))))

   ;; => Company
   `(company-echo-common ((,class (:foreground ,berrys-dark01 :background ,berrys-dark10))))
   `(company-scrollbar-bg ((,class (:foreground ,berrys-dark04 :background ,berrys-dark04))))
   `(company-scrollbar-fg ((,class (:foreground ,berrys-dark02 :background ,berrys-dark02))))
   `(company-template-field ((,class (:inherit region))))
   `(company-tooltip ((,class (:foreground ,berrys-dark02 :background ,berrys-dark04))))
   `(company-tooltip-annotation ((,class (:foreground ,berrys-dark-string))))
   `(company-tooltip-common ((,class (:inherit company-tooltip))))
   `(company-tooltip-common-selection ((,class (:inherit company-tooltip-selection))))
   `(company-tooltip-mouse ((,class (:inherit highlight))))
   `(company-tooltip-search ((,class (:inherit isearch))))
   `(company-tooltip-search-selection ((,class (:inherit company-tooltip-search))))
   `(company-tooltip-selection ((,class (:background ,berrys-dark06))))

   ;; => bm
   `(bm-face ((,class (:foreground ,berrys-dark05 :background ,berrys-dark01))))
   `(bm-fringe-face ((,class (:inherit bm-face))))
   `(bm-persistent-face ((,class (:foreground ,berrys-dark01 :background ,berrys-dark05))))
   `(bm-fringe-persistent-face ((,class (:inherit bm-persistent-face))))

   ;; => Flx
   `(flx-highlight-face ((,class (:foreground ,berrys-dark05 :weight bold))))

   ;; => Flycheck
   `(flycheck-error ((,class (:underline (:style wave :color ,berrys-dark-error)))))
   `(flycheck-fringe-error ((,class (:foreground ,berrys-dark-error :weight bold))))
   `(flycheck-fringe-info ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(flycheck-fringe-warning ((,class (:foreground ,berrys-dark-warning :weight bold))))
   `(flycheck-info ((,class (:underline (:style wave :color ,berrys-dark05)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,berrys-dark-warning)))))

    ;; => Gnus
   `(gnus-header-content ((,class (:foreground ,berrys-dark-string :italic t))))
   `(gnus-header-from ((,class (:foreground ,berrys-dark-string))))
   `(gnus-header-name ((,class (:foreground ,berrys-dark-string :weight bold))))
   `(gnus-header-subject ((,class (:foreground ,berrys-dark-string))))

   ;; => Haskell-mode
   `(haskell-error-face ((,class (:underline (:style wave :color ,berrys-dark-error)))))
   `(haskell-hole-face ((,class (:underline (:style wave :color ,berrys-dark05)))))
   `(haskell-warning-face ((,class (:underline (:style wave :color ,berrys-dark-warning)))))

   ;; => Helm
   `(helm-M-x-key ((,class (:foreground ,berrys-dark03 :underline t))))
   `(helm-buffer-directory ((,class (:inherit helm-buffer-file))))
   `(helm-buffer-not-saved ((,class (:foreground ,berrys-dark03 :slant italic))))
   `(helm-buffer-process ((,class (:foreground ,berrys-dark03))))
   `(helm-candidate-number ((,class (:weight bold))))
   `(helm-candidate-number-suspended ((,class (:foreground ,berrys-dark03 :weight bold))))
   `(helm-ff-directory ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(helm-ff-dirs ((,class (:inherit helm-ff-file))))
   `(helm-ff-dotted-directory ((,class (:inherit helm-ff-directory))))
   `(helm-ff-dotted-symlink-directory ((,class (:inherit helm-ff-dotted-directory))))
   `(helm-ff-file ((,class (:foreground ,berrys-dark02))))
   `(helm-ff-executable ((,class (:foreground ,berrys-dark08))))
   `(helm-ff-invalid-symlink ((,class (:foreground ,berrys-dark01 :background ,berrys-dark10))))
   `(helm-ff-pipe ((,class (:foreground ,berrys-dark09 :background ,berrys-dark02))))
   `(helm-ff-prefix ((,class (:foreground ,berrys-dark02 :background ,berrys-dark06))))
   `(helm-ff-socket ((,class (:foreground ,berrys-dark10 :box (:color ,berrys-dark10)))))
   `(helm-grep-file ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(helm-grep-finish ((,class (:foreground ,berrys-dark08 :weight bold))))
   `(helm-grep-lineno ((,class (:foreground ,berrys-dark03))))
   `(helm-grep-match ((,class (:inherit isearch))))
   `(helm-header ((,class (:inherit helm-source-header :background ,berrys-dark01))))
   `(helm-header-line-left-margin ((,class (:foreground ,berrys-dark01 :background ,berrys-dark09))))
   `(helm-helper ((,class (:foreground ,berrys-dark02))))
   `(helm-history-deleted ((,class (:foreground ,berrys-dark01 :background ,berrys-dark10))))
   `(helm-history-remote ((,class (:foreground ,berrys-dark10))))
   `(helm-lisp-completion-info ((,class (:foreground ,berrys-dark04 :weight bold))))
   `(helm-lisp-show-completion ((,class (:inherit isearch))))
   `(helm-locate-finish ((,class (:foreground ,berrys-dark08))))
   `(helm-match ((,class (:foreground ,berrys-dark05 :weight bold))))
   `(helm-match-item ((,class (:inherit isearch))))
   `(helm-moccur-buffer ((,class (:foreground ,berrys-dark02))))
   `(helm-mode-prefix ((,class (:foreground ,berrys-dark01 :background ,berrys-dark06))))
   `(helm-resume-need-update ((,class (:foreground ,berrys-dark01 :background ,berrys-dark10))))
   `(helm-selection ((,class (:inherit highlight))))
   `(helm-selection-line ((,class (:inherit highlight))))
   `(helm-source-header ((,class (:foreground ,berrys-dark02 :weight bold :height 1.2))))
   `(helm-separator ((,class (:foreground ,berrys-dark02))))
   `(helm-visible-mark ((,class (:background ,berrys-dark06))))
   `(helm-yas-key ((,class (:inherit helm-M-x-key))))

   ;; => Ido
   `(ido-indicator ((,class (:foreground ,berrys-dark01 :background ,berrys-dark10))))
   `(ido-only-match ((,class (:foreground ,berrys-dark05 :weight bold))))
   `(ido-subdir ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(ido-virtual ((,class (:foreground ,berrys-dark-string :weight bold))))

   ;; => Indent guide
   `(indent-guide-face ((,class (:foreground ,berrys-dark-comment))))

   ;; => Ivy
   `(ivy-confirm-face ((,class (:foreground ,berrys-dark08 :weight bold))))
   `(ivy-current-match ((,class (:background ,berrys-dark04))))
   `(ivy-cursor ((,class (:foreground ,berrys-dark01 :background ,berrys-dark02))))
   `(ivy-match-required-face ((,class (:foreground ,berrys-dark10 :weight bold))))
   `(ivy-remote ((,class (:foreground ,berrys-dark02 :underline t))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,berrys-dark05 :weight bold))))
   `(ivy-minibuffer-match-face-3 ((,class (:inherit ivy-minibuffer-match-face-2 :underline t))))
   `(ivy-minibuffer-match-face-4 ((,class (:inherit ivy-minibuffer-match-face-2 :box (:color ,berrys-dark05)))))

   ;; => Markdown
   `(markdown-code-face ((,class (:family unspecified))))
   `(markdown-header-face ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(markdown-header-face-1 ((,class (:inherit markdown-header-face :height 1.4))))
   `(markdown-header-face-2 ((,class (:inherit markdown-header-face :height 1.3))))
   `(markdown-header-face-3 ((,class (:inherit markdown-header-face :height 1.2))))
   `(markdown-header-face-4 ((,class (:inherit markdown-header-face :height 1.1))))
   `(markdown-inline-code-face ((,class (:inherit markdown-code-face))))
   `(markdown-italic-face ((,class (:inherit italic))))

   ;; => Magit
   `(magit-bisect-bad ((,class (:foreground ,berrys-dark-error))))
   `(magit-bisect-good ((,class (:foreground ,berrys-dark08))))
   `(magit-bisect-skip ((,class (:foreground ,berrys-dark09))))
   `(magit-blame-highlight ((,class (:foreground ,berrys-dark03 :background ,berrys-dark04))))
   `(magit-branch-local ((,class (:foreground ,berrys-dark05))))
   `(magit-branch-remote ((,class (:foreground ,berrys-dark08))))
   `(magit-reflog-checkout ((,class (:foreground ,berrys-dark05))))
   `(magit-diff-base ((,class (:foreground ,berrys-dark09))))
   `(magit-diff-base-highlight ((,class (:inherit magit-diff-base))))
   `(magit-diff-context ((,class (:foreground ,berrys-dark-string))))
   `(magit-diff-context-highlight ((,class (:inherit magit-diff-context))))
   `(magit-diff-added ((,class (:foreground ,berrys-dark08))))
   `(magit-diff-added-highlight ((,class (:inherit magit-diff-added))))
   `(magit-diff-file-heading ((,class (:foreground ,berrys-dark-string))))
   `(magit-diff-file-heading-selection ((,class (:inherit magit-diff-file-heading))))
   `(magit-diff-hunk-heading ((,class (:foreground ,berrys-dark03))))
   `(magit-diff-hunk-heading-highlight ((,class (:inherit magit-diff-hunk-heading))))
   `(magit-diff-hunk-heading-selection ((,class (:inherit magit-diff-hunk-heading))))
   `(magit-diff-lines-boundary((,class (:inherit unspecified))))
   `(magit-diff-lines-heading ((,class (:inherit unspecified))))
   `(magit-diff-our-highlight ((,class (:inherit magit-diff-removed))))
   `(magit-diff-removed ((,class (:foreground ,berrys-dark10))))
   `(magit-diff-removed-highlight ((,class (:inherit magit-diff-removed))))
   `(magit-diffstat-added ((,class (:foreground ,berrys-dark08))))
   `(magit-diffstat-removed ((,class (:foreground ,berrys-dark10))))
   `(magit-diff-their-highlight ((,class (:inherit magit-diff-added))))
   `(magit-diff-whitespace-warning ((,class (:foreground ,berrys-dark01 :background ,berrys-dark10))))
   `(magit-log-author ((,class (:foreground ,berrys-dark02))))
   `(magit-log-date ((,class (:foreground ,berrys-dark-comment))))
   `(magit-log-graph ((,class (:foreground ,berrys-dark-comment))))
   `(magit-hash ((,class (:foreground ,berrys-dark-comment))))
   `(magit-header-line ((,class (:foreground ,berrys-dark-string))))
   `(magit-header-line-log-select ((,class (:foreground ,berrys-dark02))))
   `(magit-process-ok ((,class (:foreground ,berrys-dark08))))
   `(magit-reflog-cherry-pick ((,class (:foreground ,berrys-dark08))))
   `(magit-reflog-commit ((,class (:foreground ,berrys-dark08))))
   `(magit-reflog-merge ((,class (:foreground ,berrys-dark08))))
   `(magit-reflog-reset ((,class (:foreground ,berrys-dark10))))
   `(magit-refname ((,class (:foreground ,berrys-dark-comment))))
   `(magit-section-heading ((,class (:foreground ,berrys-dark02))))
   `(magit-section-heading-selection ((,class (:inherit magit-section-heading))))
   `(magit-section-highlight ((,class (:inherit unspecified))))
   `(magit-section-secondary-heading ((,class (:foreground ,berrys-dark02))))
   `(magit-signature-bad ((,class (:foreground ,berrys-dark-error))))
   `(magit-signature-error ((,class (:foreground ,berrys-dark-error))))
   `(magit-signature-expired ((,class (:foreground ,berrys-dark-warning))))
   `(magit-signature-expired-key ((,class (:inherit magit-signature-expired))))
   `(magit-signature-good ((,class (:foreground ,berrys-dark08))))
   `(magit-signature-revoked ((,class (:foreground ,berrys-dark10))))
   `(magit-signature-untrusted ((,class (:foreground ,berrys-dark10))))
   `(magit-tag ((,class (:foreground ,berrys-dark05))))

   ;; => Mu4e
   `(mu4e-attach-number-face ((,class (:foreground ,berrys-dark05))))
   `(mu4e-contact-face ((,class (:foreground ,berrys-dark-string :slant italic))))
   `(mu4e-context-face ((,class (:foreground ,berrys-dark-string))))
   `(mu4e-flagged-face ((,class (:foreground ,berrys-dark09))))
   `(mu4e-header-face ((,class (:foreground ,berrys-dark02))))
   `(mu4e-header-highlight-face ((,class (:inherit highlight))))
   `(mu4e-header-key-face ((,class (:foreground ,berrys-dark-string :weight bold))))
   `(mu4e-header-marks-face ((,class (:foreground ,berrys-dark05 :weight bold))))
   `(mu4e-header-value-face ((,class (:foreground ,berrys-dark-string :slant italic))))
   `(mu4e-highlight-face ((,class (:foreground ,berrys-dark05))))
   `(mu4e-special-header-value-face ((,class (:foreground ,berrys-dark-string :slant italic))))
   `(mu4e-region-code ((,class (:box (:color ,berrys-dark05)))))
   `(mu4e-replied-face ((,class :slant italic)))
   `(mu4e-url-number-face ((,class (:foreground ,berrys-dark05))))

   ;; => Org mode
   `(org-agenda-date ((,class (:foreground ,berrys-dark02))))
   `(org-agenda-diary ((,class (:foreground ,berrys-dark-string :slant italic))))
   `(org-agenda-dimmed-todo-face ((,class (:foreground ,berrys-dark-comment :slant italic))))
   `(org-agenda-done ((,class (:foreground ,berrys-dark-string :slant italic :strike-through t))))
   `(org-agenda-restriction-lock ((,class (:background ,berrys-dark04))))
   `(org-agenda-structure ((,class (:foreground ,berrys-dark02 :weight bold :height 1.2))))
   `(org-block ((,class (:foreground ,berrys-dark02 :background "#333333" :inherit 'fixed-pitch :extend t))))
   `(org-block-background ((,class (:background "#333333" :extend t))))

   `(org-block-begin-line ((,class (:background "#222222" :weight bold :extend t))))
   `(org-block-end-line ((,class (:background "#222222" :weight bold :extend t))))

   `(org-hide ((,class (:foreground ,berrys-dark03 :background ,berrys-dark03 :inherit 'fixed-pitch))))
   `(org-indent ((,class (:foreground ,berrys-dark01 :background ,berrys-dark01 :inherit 'fixed-pitch))))
   `(org-code ((,class (:foreground ,berrys-dark02 :background "#333333" :weight bold :inherit 'fixed-pitch))))


   `(org-clock-overlay ((,class (:inherit secondary-selection))))
   `(org-column ((,class (:foreground ,berrys-dark-string :slant normal))))
   `(org-column-title ((,class (:foreground ,berrys-dark02 :weight bold))))
   `(org-date ((,class (:foreground ,berrys-dark02 :slant italic))))
   `(org-date-selected ((,class (:foreground ,berrys-dark05 :weight bold))))
   `(org-document-info ((,class (:foreground ,berrys-dark03))))
   `(org-document-title ((,class (:foreground ,berrys-dark03 :weight bold))))
   `(org-done ((,class(:height 1.0 :foreground ,berrys-dark08))))
   `(org-ellipsis ((,class (:foreground ,berrys-dark05 :inherit unspecified))))
   `(org-footnote ((,class (:foreground ,berrys-dark02 :underline t))))
   `(org-formula ((,class (:foreground ,berrys-dark-string))))
   `(org-headline-done ((,class (:inherit org-level-1 :strike-through t))))
   `(org-latex-and-related ((,class (:foreground ,berrys-dark-string))))
   `(org-level-1 ((,class (:weight bold :foreground ,berrys-dark02 :height 1.4))))
   `(org-level-2 ((,class (:weight bold :foreground ,berrys-dark02 :height 1.4))))
   `(org-level-3 ((,class (:weight bold :foreground ,berrys-dark02 :height 1.4))))
   `(org-level-4 ((,class (:weight bold :foreground ,berrys-dark02 :height 1.07))))
   `(org-level-5 ((,class (:weight bold :foreground ,berrys-dark02 :height 1.07))))
   `(org-level-6 ((,class (:weight bold :foreground ,berrys-dark02 :height 1.07))))
   `(org-level-7 ((,class (:weight bold :foreground ,berrys-dark02 :height 1.07))))
   `(org-level-8 ((,class (:weight bold :foreground ,berrys-dark02 :height 1.07))))
   `(org-link ((,class (:foreground ,berrys-dark03 :inherit unspecified :underline t))))
   `(org-mode-line-clock ((,class (:inherit mode-line))))
   `(org-mode-line-clock-overrun ((,class (:foreground ,berrys-dark09))))
   `(org-priority ((,class(:inherit org-level-1 :foreground ,berrys-dark05))))
   `(org-scheduled ((,class (:foreground ,berrys-dark02 :slant italic))))
   `(org-scheduled-previously ((,class (:foreground ,berrys-dark10 :slant italic))))
   `(org-scheduled-today ((,class (:inherit org-scheduled))))
   `(org-sexp-date ((,class (:foreground ,berrys-dark-string :slant italic))))
   `(org-special-keyword ((,class (:foreground ,berrys-dark-string))))
   `(org-table ((,class (:foreground ,berrys-dark02 :inherit 'fixed-pitch))))
   `(org-tag ((,class(:inherit org-level-1 :foreground ,berrys-dark05))))
   `(org-time-grid ((,class (:foreground ,berrys-dark-string :slant italic))))
   `(org-todo ((,class (:height 1.0 :foreground ,berrys-dark10))))
   `(org-upcoming-deadline ((,class (:foreground ,berrys-dark09 :slant italic))))
   `(org-warning ((,class (:foreground ,berrys-dark09 :slant italic))))
   ;; `(org-verbatim ((,class (:inherit default))))
   `(org-verbatim ((,class (:foreground ,berrys-dark02 :background "#9BA85C" :weight normal))))

   ;; Org Pomodoro
   `(org-pomodoro-mode-line ((,class (:foreground ,berrys-dark05 :weight bold))))
   `(org-pomodoro-mode-line-break ((,class (:foreground ,berrys-dark08 :weight bold))))
   `(org-pomodoro-mode-line-overtime ((,class (:foreground ,berrys-dark-error :weight bold))))

   ;; => Which key
   `(which-key-key-face ((,class (:foreground ,berrys-dark05 :weight bold))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'berrys-dark)
(provide 'berrys-dark-theme)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; berrys-dark-theme.el ends here
