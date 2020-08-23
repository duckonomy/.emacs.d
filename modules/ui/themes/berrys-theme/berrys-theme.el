;;; berrys-theme.el --- A light, clean and elegant theme -*- lexical-binding: t; -*-

;; Copyright © 2019-present Slava Buzin

;; Title: Berrys Theme
;; Project: berrys-theme
;; Version: 0.1.0
;; Package-Version: 20191201.1609
;; Package-Commit: 888a14206b2fb3dc45b5273aeb05075f3e0b5f60
;; URL: https://github.com/vbuzin/berrys-theme
;; Author: Slava Buzin <v8v.buzin@gmail.com>
;; Package-Requires: ((emacs "24.1"))
;; License: MIT

;;; Commentary:

;; Berrys is a 9 colorspace theme build to run in GUI mode
;; with support for some third-party syntax- and UI packages.

;;; Code:

(deftheme berrys "A light, clean and elegant theme")

;;;; Colors
(let* ((class '((class color) (min-colors 89)))
       (berrys00       nil)

       (berrys01       "#fdfdfd") ;; bg
       (berrys02       "#545954") ;; fg
       (berrys03       "#9B9FB8") ;; dark gray
       ;; (berrys04       "#E2E3E8") ;; light gray
       (berrys04       "#ECF0F1") ;; light gray
       ;; (berrys04       "#EAEAEA") ;; light gray

       (berrys05       "#1098F7") ;; blue (saturated)
       (berrys06       "#B2EAFF") ;; blue (sky)

       (berrys07       "#BE82B2") ;; violet

       (berrys08       "#42B983") ;; green

       (berrys09       "#F1C867") ;; peach/yellow

       (berrys10       "#E78A88") ;; red

       (berrys-cursor  berrys05)
       (berrys-comment berrys03)
       (berrys-string  berrys03)

       (berrys-warning berrys09)
       (berrys-error   berrys10))

  (custom-theme-set-faces
   'berrys

   ;;; Core
   ;; =============================================================================
   ;; => Base
   `(bold ((,class (:weight bold))))
   `(bold-italic ((,class (:weight bold :slant italic))))
   `(default ((,class (:foreground ,berrys02 :background ,berrys01))))
   `(error ((,class (:foreground ,berrys-error))))
   `(fixed-pitch-serif ((,class (:family unspecified))))
   `(font-lock-builtin-face ((,class (:foreground ,berrys02 :weight bold))))
   `(font-lock-comment-face ((,class (:foreground ,berrys-comment :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,berrys-comment :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,berrys02 :weight bold))))
   `(font-lock-doc-face ((,class (:inherit (font-lock-comment-face)))))
   `(font-lock-function-name-face ((,class (:foreground ,berrys02 :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,berrys02 :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,berrys-string))))
   `(font-lock-type-face ((,class (:foreground ,berrys02 :slant italic))))
   `(font-lock-variable-name-face ((,class (:foreground ,berrys02))))
   `(font-lock-warning-face ((,class (:inherit warning))))
   `(shadow ((,class (:foreground ,berrys03))))
   `(warning ((,class (:foreground ,berrys-warning))))

   ;; => Core UI
   `(cursor ((,class (:background ,berrys-cursor :inverse-video t))))
   `(custom-button ((,class (:background ,berrys05 :foreground ,berrys01))))
   `(custom-variable-tag ((,class (:foreground ,berrys02 :weight bold))))
   `(custom-visibility ((,class (:inherit link))))

   `(custom-group-tag ((,class (:foreground ,berrys05 :height 1.5 :weight bold))))
   `(custom-group-tag-1 ((,class (:foreground ,berrys07 :height 1.5 :weight bold))))

   `(custom-changed ((,class (:foreground ,berrys05 :background ,berrys01))))
   `(custom-invalid ((,class (:background ,berrys10 :background ,berrys04))))
   `(custom-modified ((,class (:foreground ,berrys05 :background ,berrys04))))
   `(custom-themed ((,class (:foreground ,berrys09 :background ,berrys01))))

   `(diff-added ((,class (:foreground ,berrys08))))
   `(diff-context ((,class (:foreground ,berrys-string))))
   `(diff-file-header ((,class (:inherit diff-header))))
   `(diff-header ((,class (:foreground ,berrys03))))
   `(diff-hunk-header ((,class (:inherit diff-header))))
   `(diff-indicator-added ((,class (:foreground ,berrys08))))
   `(diff-refine-added ((,class (:foreground ,berrys08))))
   `(diff-refine-changed ((,class (:foreground ,berrys09))))
   `(diff-refine-removed ((,class (:foreground ,berrys10))))
   `(diff-removed ((,class (:foreground ,berrys10))))

   ;; Dired
   `(dired-directory ((,class :foreground ,berrys02 :weight bold)))

   ;; Dired Subtree
   `(dired-subtree-depth-1-face ((,class :background "#F7F7F7")))
   `(dired-subtree-depth-2-face ((,class :background "#F1F1F1")))
   `(dired-subtree-depth-3-face ((,class :background "#E7E7E7")))
   `(dired-subtree-depth-4-face ((,class :background "#E1E1E1")))
   `(dired-subtree-depth-5-face ((,class :background "#D7D7D7")))
   `(dired-subtree-depth-6-face ((,class :background "#CECECE")))

   `(header-line ((,class :foreground ,berrys02 :weight bold)))
   `(line-number-current-line ((,class (:inherit line-number :foreground ,berrys05))))
   `(highlight ((,class (:background ,berrys04))))
   `(hl-line ((,class (:background ,berrys04))))
   `(info-node ((,class (:foreground ,berrys05 :weight bold))))
   `(info-menu-header ((,class (:foreground ,berrys02 :weight bold))))
   `(info-menu-star ((,class (:foreground ,berrys05))))
   `(info-title-4 ((,class (:foreground ,berrys02 :weight bold))))
   `(isearch ((,class (:background ,berrys06 :weight bold))))
   `(isearch-fail ((,class (:foreground ,berrys01 :background ,berrys-error))))
   `(lazy-highlight ((,class (:inherit isearch))))
   `(link ((,class (:underline t))))
   `(link-visited ((,class (:underline t))))
   `(match ((,class (:inherit isearch))))
   `(message-cited-text ((,class (:inherit font-lock-comment-face))))
   `(message-header-cc ((,class (:foreground ,berrys-string))))
   `(message-header-name ((,class (:foreground ,berrys-string))))
   `(message-header-newsgroups ((,class (:foreground ,berrys-string :slant italic :weight bold))))
   `(message-header-other ((,class (:foreground ,berrys-string))))
   `(message-header-subject ((,class (:foreground ,berrys-string))))
   `(message-header-to ((,class (:foreground ,berrys-string))))
   `(message-header-xheader ((,class (:foreground ,berrys-string))))
   `(message-mml ((,class (:foreground ,berrys-string))))
   `(message-separator ((,class (:inherit font-lock-comment-face))))

   `(term ((,class (:foreground ,berrys02))))
   `(term-bold ((,class (:weight bold))))
   `(term-color-black   ((,class (:foreground ,berrys03))))
   `(term-color-red     ((,class (:foreground ,berrys10))))
   `(term-color-green   ((,class (:foreground ,berrys08))))
   `(term-color-yellow  ((,class (:foreground ,berrys09))))
   `(term-color-blue    ((,class (:foreground ,berrys05))))
   `(term-color-magenta ((,class (:foreground ,berrys07))))
   `(term-color-cyan    ((,class (:foreground ,berrys06))))
   `(term-color-white   ((,class (:foreground ,berrys03))))

   `(vterm ((,class (:foreground ,berrys-string))))
   `(vterm-color-black   ((,class (:foreground ,berrys03))))
   `(vterm-color-red     ((,class (:foreground ,berrys10))))
   `(vterm-color-green   ((,class (:foreground ,berrys08))))
   `(vterm-color-yellow  ((,class (:foreground ,berrys09))))
   `(vterm-color-blue    ((,class (:foreground ,berrys05))))
   `(vterm-color-magenta ((,class (:foreground ,berrys07))))
   `(vterm-color-cyan    ((,class (:foreground ,berrys06))))
   `(vterm-color-white   ((,class (:foreground ,berrys03))))

   `(eshell-prompt    ((,class (:foreground ,berrys04 :weight bold))))
   `(eshell-ls-archive    ((,class (:foreground ,berrys07))))
   `(eshell-ls-backup     ((,class (:foreground ,berrys09))))
   `(eshell-ls-clutter    ((,class (:foreground ,berrys10))))
   `(eshell-ls-directory  ((,class (:foreground ,berrys05))))
   `(eshell-ls-executable ((,class (:foreground ,berrys08))))
   `(eshell-ls-missing    ((,class (:foreground ,berrys10))))
   `(eshell-ls-product    ((,class (:foreground ,berrys09))))
   `(eshell-ls-readonly   ((,class (:foreground ,berrys09))))
   `(eshell-ls-special    ((,class (:foreground ,berrys07))))
   `(eshell-ls-symlink    ((,class (:foreground ,berrys06))))
   `(eshell-ls-unreadable ((,class (:foreground ,berrys03))))

   `(comint-highlight-prompt ((,class (:foreground nil :background nil :inherit nil))))
   `(comint-highlight-input ((,class (:foreground nil :background nil))))

    ;; (shell-prompt        :foreground highlight :weight 'bold)
    ;; (shell-ls-archive    :foreground magenta)
    ;; (shell-ls-backup     :foreground yellow)
    ;; (shell-ls-clutter    :foreground red)
    ;; (shell-ls-directory  :foreground blue)
    ;; (shell-ls-executable :foreground green)
    ;; (shell-ls-missing    :foreground red)
    ;; (shell-ls-product    :foreground orange)
    ;; (shell-ls-readonly   :foreground orange)
    ;; (shell-ls-special    :foreground violet)
    ;; (shell-ls-symlink    :foreground cyan)
    ;; (shell-ls-unreadable :foreground base5)

   `(minibuffer-prompt ((,class (:foreground ,berrys02 :weight bold))))
   ;; `(mode-line ((,class (:foreground ,berrys02 :background "#fafafa" :box (:line-width 16 :color "#FAFAFA")))))
   `(mode-line ((,class (:foreground ,berrys02 :background "#f7f7f7" :box (:line-width 16 :color "#f7f7f7")))))
   `(mode-line-buffer-id ((,class (:weight bold))))
   `(mode-line-highlight ((,class (:inherit highlight))))

   `(lui-time-stamp-face ((,class (:foreground "#A7A7A7"))))
   `(lui-highlight-face ((,class (:foreground "#CDCDCD"))))
   `(lui-button-face ((,class (:foreground "#9B9FB8" :underline t))))

   `(circe-fool ((,class (:foreground ,berrys03))))
   `(circe-highlight-nick-face ((,class (:weight bold :foreground "#696969"))))
   `(circe-prompt-face ((,class (:weight bold :foreground "#CDCDCD" :background ,berrys01))))
   `(circe-server-face ((,class (:foreground ,berrys03))))
   `(circe-my-message-face ((,class (:weight bold))))

   `(elfeed-log-debug-level-face ((,class (:foreground ,berrys03))))
   `(elfeed-log-error-level-face ((,class (:foreground ,berrys10))))
   `(elfeed-log-info-level-face  ((,class (:foreground "#A7A7A7"))))
   `(elfeed-log-warn-level-face  ((,class (:foreground ,berrys09))))
   `(elfeed-search-date-face     ((,class (:foreground "#BBBBBB"))))
   `(elfeed-search-feed-face     ((,class (:foreground ,"#666666" :slant italic))))
   `(elfeed-search-tag-face      ((,class (:foreground ,berrys03))))
   `(elfeed-search-title-face    ((,class (:foreground ,berrys03))))
   `(elfeed-search-filter-face   ((,class (:foreground "#AAAAAA"))))
   `(elfeed-search-unread-count-face ((,class (:foreground ,"#BEBEBE"))))
   `(elfeed-search-unread-title-face ((,class (:foreground ,berrys02 :weight bold)))) ;; 02

   ;; `(mode-line-inactive ((,class (:foreground ,berrys02 :background ,berrys01 :box (:color ,berrys04)))))

   `(mode-line-inactive ((,class (:foreground ,berrys02 :background ,berrys01 :box (:line-width 16 :color ,berrys01)))))
   `(mode-line-emphasis ((,class (:weight bold :foreground, berrys05))))

   `(tab-bar ((,class (:inherit fixed-pitch :background "#FDFDFD" :foreground "#555555" :height 1.15))))
   `(tab-bar-tab ((,class (:inherit tab-bar :box (:line-width (15 . 15) :color "#FDFDFD")))))
   `(tab-bar-tab-inactive ((,class (:inherit tab-bar-tab :background "#F1f1f1" :box (:line-width (15 . 15) :color "#F1F1F1")))))
   `(tab-line ((,class (:inherit fixed-pitch :background "#FDFDFD" :foreground "#555555" :height 1.0))))
   `(tab-line-tab ((,class (:inherit tab-line :box (:line-width (13 . 13) :color "#FDFDFD")))))
   `(tab-line-tab-current ((,class (:inherit tab-line-tab :background "#FDFDFD" :box (:line-width (13 . 13) :color "#FDFDFD")))))
   `(tab-line-tab-inactive ((,class (:inherit tab-line-tab :background "#F1F1F1" :box (:line-width (13 . 13) :color "#F1F1F1")))))

   `(outline-1 ((,class (:foreground ,berrys02 :weight bold))))
   `(outline-2 ((,class (:inherit outline-1))))
   `(outline-3 ((,class (:inherit outline-1))))
   `(outline-4 ((,class (:inherit outline-1))))
   `(outline-5 ((,class (:inherit outline-1))))
   `(outline-6 ((,class (:inherit outline-1))))
   `(outline-7 ((,class (:inherit outline-1))))
   `(outline-8 ((,class (:inherit outline-1))))
   `(region ((,class (:background ,berrys04))))
   `(secondary-selection ((,class (:background ,berrys04 :foreground ,berrys02))))
   `(show-paren-match ((,class (:background ,berrys06 :foreground ,berrys02 :weight bold))))
   `(show-paren-mismatch ((,class (:foreground ,berrys-error :weight bold))))
   `(success ((,class (:foreground ,berrys08))))
   `(whitespace-big-indent ((,class (:foreground ,berrys01 :background ,berrys10))))
   `(whitespace-line ((,class (:background ,berrys01))))
   `(whitespace-trailing ((,class (:foreground ,berrys01 :background ,berrys10))))
   `(trailing-whitespace((,class (:background ,berrys10))))

   ;;; Packages
   ;; =============================================================================
   ;; => Ace jump
   `(ace-jump-face-foreground ((,class (:foreground ,berrys05 :weight bold))))

   ;; => Anzu
   `(anzu-match-1 ((,class (:foreground ,berrys05 :weight bold :box (:color ,berrys05)))))
   `(anzu-match-2 ((,class (:foreground ,berrys01 :background ,berrys05 :weight bold :box (:color ,berrys05)))))
   `(anzu-match-3 ((,class (:foreground ,berrys01 :background ,berrys03 :weight bold :box (:color ,berrys03)))))
   `(anzu-mode-line ((,class (:foreground ,berrys02 :weight bold))))
   `(anzu-mode-line-no-match ((,class (:foreground ,berrys10 :weight bold))))
   `(anzu-replace-to ((,class (:foreground ,berrys-string :weight bold))))

   ;; => Company
   `(company-echo-common ((,class (:foreground ,berrys01 :background ,berrys10))))
   `(company-scrollbar-bg ((,class (:foreground ,berrys04 :background ,berrys04))))
   `(company-scrollbar-fg ((,class (:foreground ,berrys02 :background ,berrys02))))
   `(company-template-field ((,class (:inherit region))))
   `(company-tooltip ((,class (:foreground ,berrys02 :background ,berrys04))))
   `(company-tooltip-annotation ((,class (:foreground ,berrys-string))))
   `(company-tooltip-common ((,class (:inherit company-tooltip))))
   `(company-tooltip-common-selection ((,class (:inherit company-tooltip-selection))))
   `(company-tooltip-mouse ((,class (:inherit highlight))))
   `(company-tooltip-search ((,class (:inherit isearch))))
   `(company-tooltip-search-selection ((,class (:inherit company-tooltip-search))))
   `(company-tooltip-selection ((,class (:background ,berrys06))))

   ;; => bm
   `(bm-face ((,class (:foreground ,berrys05 :background ,berrys01))))
   `(bm-fringe-face ((,class (:inherit bm-face))))
   `(bm-persistent-face ((,class (:foreground ,berrys01 :background ,berrys05))))
   `(bm-fringe-persistent-face ((,class (:inherit bm-persistent-face))))

   ;; => Flx
   `(flx-highlight-face ((,class (:foreground ,berrys05 :weight bold))))

   ;; => Flycheck
   `(flycheck-error ((,class (:underline (:style wave :color ,berrys-error)))))
   `(flycheck-fringe-error ((,class (:foreground ,berrys-error :weight bold))))
   `(flycheck-fringe-info ((,class (:foreground ,berrys02 :weight bold))))
   `(flycheck-fringe-warning ((,class (:foreground ,berrys-warning :weight bold))))
   `(flycheck-info ((,class (:underline (:style wave :color ,berrys05)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,berrys-warning)))))

    ;; => Gnus
   `(gnus-header-content ((,class (:foreground ,berrys-string :italic t))))
   `(gnus-header-from ((,class (:foreground ,berrys-string))))
   `(gnus-header-name ((,class (:foreground ,berrys-string :weight bold))))
   `(gnus-header-subject ((,class (:foreground ,berrys-string))))

   ;; => Haskell-mode
   `(haskell-error-face ((,class (:underline (:style wave :color ,berrys-error)))))
   `(haskell-hole-face ((,class (:underline (:style wave :color ,berrys05)))))
   `(haskell-warning-face ((,class (:underline (:style wave :color ,berrys-warning)))))

   ;; => Helm
   `(helm-M-x-key ((,class (:foreground ,berrys03 :underline t))))
   `(helm-buffer-directory ((,class (:inherit helm-buffer-file))))
   `(helm-buffer-not-saved ((,class (:foreground ,berrys03 :slant italic))))
   `(helm-buffer-process ((,class (:foreground ,berrys03))))
   `(helm-candidate-number ((,class (:weight bold))))
   `(helm-candidate-number-suspended ((,class (:foreground ,berrys03 :weight bold))))
   `(helm-ff-directory ((,class (:foreground ,berrys02 :weight bold))))
   `(helm-ff-dirs ((,class (:inherit helm-ff-file))))
   `(helm-ff-dotted-directory ((,class (:inherit helm-ff-directory))))
   `(helm-ff-dotted-symlink-directory ((,class (:inherit helm-ff-dotted-directory))))
   `(helm-ff-file ((,class (:foreground ,berrys02))))
   `(helm-ff-executable ((,class (:foreground ,berrys08))))
   `(helm-ff-invalid-symlink ((,class (:foreground ,berrys01 :background ,berrys10))))
   `(helm-ff-pipe ((,class (:foreground ,berrys09 :background ,berrys02))))
   `(helm-ff-prefix ((,class (:foreground ,berrys02 :background ,berrys06))))
   `(helm-ff-socket ((,class (:foreground ,berrys10 :box (:color ,berrys10)))))
   `(helm-grep-file ((,class (:foreground ,berrys02 :weight bold))))
   `(helm-grep-finish ((,class (:foreground ,berrys08 :weight bold))))
   `(helm-grep-lineno ((,class (:foreground ,berrys03))))
   `(helm-grep-match ((,class (:inherit isearch))))
   `(helm-header ((,class (:inherit helm-source-header :background ,berrys01))))
   `(helm-header-line-left-margin ((,class (:foreground ,berrys01 :background ,berrys09))))
   `(helm-helper ((,class (:foreground ,berrys02))))
   `(helm-history-deleted ((,class (:foreground ,berrys01 :background ,berrys10))))
   `(helm-history-remote ((,class (:foreground ,berrys10))))
   `(helm-lisp-completion-info ((,class (:foreground ,berrys04 :weight bold))))
   `(helm-lisp-show-completion ((,class (:inherit isearch))))
   `(helm-locate-finish ((,class (:foreground ,berrys08))))
   `(helm-match ((,class (:foreground ,berrys05 :weight bold))))
   `(helm-match-item ((,class (:inherit isearch))))
   `(helm-moccur-buffer ((,class (:foreground ,berrys02))))
   `(helm-mode-prefix ((,class (:foreground ,berrys01 :background ,berrys06))))
   `(helm-resume-need-update ((,class (:foreground ,berrys01 :background ,berrys10))))
   `(helm-selection ((,class (:inherit highlight))))
   `(helm-selection-line ((,class (:inherit highlight))))
   `(helm-source-header ((,class (:foreground ,berrys02 :weight bold :height 1.2))))
   `(helm-separator ((,class (:foreground ,berrys02))))
   `(helm-visible-mark ((,class (:background ,berrys06))))
   `(helm-yas-key ((,class (:inherit helm-M-x-key))))

   ;; => Ido
   `(ido-indicator ((,class (:foreground ,berrys01 :background ,berrys10))))
   `(ido-only-match ((,class (:foreground ,berrys05 :weight bold))))
   `(ido-subdir ((,class (:foreground ,berrys02 :weight bold))))
   `(ido-virtual ((,class (:foreground ,berrys-string :weight bold))))

   ;; => Indent guide
   `(indent-guide-face ((,class (:foreground ,berrys-comment))))

   ;; => Ivy
   `(ivy-confirm-face ((,class (:foreground ,berrys08 :weight bold))))
   `(ivy-current-match ((,class (:background ,berrys04))))
   `(ivy-cursor ((,class (:foreground ,berrys01 :background ,berrys02))))
   `(ivy-match-required-face ((,class (:foreground ,berrys10 :weight bold))))
   `(ivy-remote ((,class (:foreground ,berrys02 :underline t))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,berrys05 :weight bold))))
   `(ivy-minibuffer-match-face-3 ((,class (:inherit ivy-minibuffer-match-face-2 :underline t))))
   `(ivy-minibuffer-match-face-4 ((,class (:inherit ivy-minibuffer-match-face-2 :box (:color ,berrys05)))))

   ;; => Lsp
   `(lsp-ui-peek-highlight ((,class (:foreground ,berrys09 :weight bold))))
   `(lsp-ui-sideline-symbol-info ((,class (:foreground ,berrys08 :weight bold))))
   `(lsp-ui-sideline-code-action ((,class (:foreground ,berrys09 :weight bold))))
   `(lsp-ui-peek-filename ((,class (:foreground ,berrys10 :weight bold))))

   ;; => Git Gutter
   `(git-gutter:added ((,class (:foreground ,berrys08 :weight bold))))
   `(git-gutter:deleted ((,class (:foreground ,berrys10 :weight bold))))
   `(git-gutter:modified ((,class (:foreground ,berrys07 :weight bold))))
   `(git-gutter:separator ((,class (:foreground ,berrys05 :weight bold))))
   `(git-gutter:unchanged ((,class (:background ,berrys09 :weight bold))))

   ;; => Markdown
   `(markdown-code-face ((,class (:family unspecified))))
   `(markdown-header-face ((,class (:foreground ,berrys02 :weight bold))))
   `(markdown-header-face-1 ((,class (:inherit markdown-header-face :height 1.4))))
   `(markdown-header-face-2 ((,class (:inherit markdown-header-face :height 1.3))))
   `(markdown-header-face-3 ((,class (:inherit markdown-header-face :height 1.2))))
   `(markdown-header-face-4 ((,class (:inherit markdown-header-face :height 1.1))))
   `(markdown-inline-code-face ((,class (:inherit markdown-code-face))))
   `(markdown-italic-face ((,class (:inherit italic))))

   ;; => Magit
   `(magit-bisect-bad ((,class (:foreground ,berrys-error))))
   `(magit-bisect-good ((,class (:foreground ,berrys08))))
   `(magit-bisect-skip ((,class (:foreground ,berrys09))))
   `(magit-blame-highlight ((,class (:foreground ,berrys03 :background ,berrys04))))
   `(magit-branch-local ((,class (:foreground ,berrys05))))
   `(magit-branch-remote ((,class (:foreground ,berrys08))))
   `(magit-reflog-checkout ((,class (:foreground ,berrys05))))
   `(magit-diff-base ((,class (:foreground ,berrys09))))
   `(magit-diff-base-highlight ((,class (:inherit magit-diff-base))))
   `(magit-diff-context ((,class (:foreground ,berrys-string))))
   `(magit-diff-context-highlight ((,class (:inherit magit-diff-context))))
   `(magit-diff-added ((,class (:foreground ,berrys08))))
   `(magit-diff-added-highlight ((,class (:inherit magit-diff-added))))
   `(magit-diff-file-heading ((,class (:foreground ,berrys-string))))
   `(magit-diff-file-heading-selection ((,class (:inherit magit-diff-file-heading))))
   `(magit-diff-hunk-heading ((,class (:foreground ,berrys03))))
   `(magit-diff-hunk-heading-highlight ((,class (:inherit magit-diff-hunk-heading))))
   `(magit-diff-hunk-heading-selection ((,class (:inherit magit-diff-hunk-heading))))
   `(magit-diff-lines-boundary((,class (:inherit unspecified))))
   `(magit-diff-lines-heading ((,class (:inherit unspecified))))
   `(magit-diff-our-highlight ((,class (:inherit magit-diff-removed))))
   `(magit-diff-removed ((,class (:foreground ,berrys10))))
   `(magit-diff-removed-highlight ((,class (:inherit magit-diff-removed))))
   `(magit-diffstat-added ((,class (:foreground ,berrys08))))
   `(magit-diffstat-removed ((,class (:foreground ,berrys10))))
   `(magit-diff-their-highlight ((,class (:inherit magit-diff-added))))
   `(magit-diff-whitespace-warning ((,class (:foreground ,berrys01 :background ,berrys10))))
   `(magit-log-author ((,class (:foreground ,berrys02))))
   `(magit-log-date ((,class (:foreground ,berrys-comment))))
   `(magit-log-graph ((,class (:foreground ,berrys-comment))))
   `(magit-hash ((,class (:foreground ,berrys-comment))))
   `(magit-header-line ((,class (:foreground ,berrys-string))))
   `(magit-header-line-log-select ((,class (:foreground ,berrys02))))
   `(magit-process-ok ((,class (:foreground ,berrys08))))
   `(magit-reflog-cherry-pick ((,class (:foreground ,berrys08))))
   `(magit-reflog-commit ((,class (:foreground ,berrys08))))
   `(magit-reflog-merge ((,class (:foreground ,berrys08))))
   `(magit-reflog-reset ((,class (:foreground ,berrys10))))
   `(magit-refname ((,class (:foreground ,berrys-comment))))
   `(magit-section-heading ((,class (:foreground ,berrys02))))
   `(magit-section-heading-selection ((,class (:inherit magit-section-heading))))
   `(magit-section-highlight ((,class (:inherit unspecified))))
   `(magit-section-secondary-heading ((,class (:foreground ,berrys02))))
   `(magit-signature-bad ((,class (:foreground ,berrys-error))))
   `(magit-signature-error ((,class (:foreground ,berrys-error))))
   `(magit-signature-expired ((,class (:foreground ,berrys-warning))))
   `(magit-signature-expired-key ((,class (:inherit magit-signature-expired))))
   `(magit-signature-good ((,class (:foreground ,berrys08))))
   `(magit-signature-revoked ((,class (:foreground ,berrys10))))
   `(magit-signature-untrusted ((,class (:foreground ,berrys10))))
   `(magit-tag ((,class (:foreground ,berrys05))))
   `(magit-cherry-equivalent ((,class (:foreground ,berrys07))))
   `(magit-cherry-unmatched ((,class (:foreground ,berrys05))))
   `(magit-process-ng ((,class (:foreground ,berrys10))))
   `(magit-reflog-amend ((,class (:foreground ,berrys07))))
   `(magit-reflog-other ((,class (:foreground ,berrys05))))
   `(magit-reflog-rebase ((,class (:foreground ,berrys07))))
   `(magit-reflog-remote ((,class (:foreground ,berrys05))))

   ;; => Mu4e
   `(mu4e-attach-number-face ((,class (:foreground ,berrys05))))
   `(mu4e-contact-face ((,class (:foreground ,berrys-string :slant italic))))
   `(mu4e-context-face ((,class (:foreground ,berrys-string))))
   `(mu4e-flagged-face ((,class (:foreground ,berrys09))))
   `(mu4e-header-face ((,class (:foreground ,berrys02))))
   `(mu4e-header-highlight-face ((,class (:inherit highlight))))
   `(mu4e-header-key-face ((,class (:foreground ,berrys-string :weight bold))))
   `(mu4e-header-marks-face ((,class (:foreground ,berrys05 :weight bold))))
   `(mu4e-header-value-face ((,class (:foreground ,berrys-string :slant italic))))
   `(mu4e-highlight-face ((,class (:foreground ,berrys05))))
   `(mu4e-special-header-value-face ((,class (:foreground ,berrys-string :slant italic))))
   `(mu4e-region-code ((,class (:box (:color ,berrys05)))))
   `(mu4e-replied-face ((,class :slant italic)))
   `(mu4e-url-number-face ((,class (:foreground ,berrys05))))

   ;; => Org mode
   `(org-agenda-date ((,class (:foreground ,berrys02))))
   `(org-agenda-diary ((,class (:foreground ,berrys-string :slant italic))))
   `(org-agenda-dimmed-todo-face ((,class (:foreground ,berrys-comment :slant italic))))
   `(org-agenda-done ((,class (:foreground ,berrys-string :slant italic :strike-through t))))
   `(org-agenda-restriction-lock ((,class (:background ,berrys04))))
   `(org-agenda-structure ((,class (:foreground ,berrys02 :weight bold :height 1.2))))
   `(org-block ((,class (:foreground ,berrys02 :background "#f9f9f9" :inherit 'fixed-pitch :extend t))))
   `(org-block-background ((,class (:background "#f9f9f9" :extend t))))

   `(org-block-begin-line ((,class (:background "#f3f3f3" :weight bold :extend t))))
   `(org-block-end-line ((,class (:background "#f3f3f3" :weight bold :extend t))))

   ;; `(org-hide ((,class (:foreground ,berrys03 :background ,berrys03 :inherit 'fixed-pitch))))
   `(org-hide ((,class (:foreground ,berrys01 :background ,berrys01 :inherit 'fixed-pitch))))
   `(org-indent ((,class (:foreground ,berrys01 :background ,berrys01 :inherit 'fixed-pitch))))
   `(org-code ((,class (:foreground ,berrys02 :background "#f0f0f0" :weight bold :inherit 'fixed-pitch))))


   `(org-clock-overlay ((,class (:inherit secondary-selection))))
   `(org-column ((,class (:foreground ,berrys-string :slant normal))))
   `(org-column-title ((,class (:foreground ,berrys02 :weight bold))))
   `(org-date ((,class (:foreground ,berrys02 :slant italic))))
   `(org-date-selected ((,class (:foreground ,berrys05 :weight bold))))
   `(org-document-info ((,class (:foreground ,berrys03))))
   `(org-document-title ((,class (:foreground ,berrys03 :weight bold))))
   `(org-done ((,class(:height 1.0 :foreground ,berrys08))))
   `(org-ellipsis ((,class (:foreground "#B3B3B3" :inherit unspecified))))
   `(org-footnote ((,class (:foreground ,berrys02 :underline t))))
   `(org-formula ((,class (:foreground ,berrys-string))))
   `(org-headline-done ((,class (:inherit org-level-1 :strike-through t))))
   `(org-latex-and-related ((,class (:foreground ,berrys-string))))
   `(org-level-1 ((,class (:weight normal :foreground ,berrys02 :height 1.5))))
   `(org-level-2 ((,class (:weight normal :foreground ,berrys02 :height 1.3))))
   `(org-level-3 ((,class (:weight normal :foreground ,berrys02 :height 1.13))))
   `(org-level-4 ((,class (:weight light :foreground ,berrys02 :height 1.07))))
   `(org-level-5 ((,class (:weight light :foreground ,berrys02 :height 1.07))))
   `(org-level-6 ((,class (:weight light :foreground ,berrys02 :height 1.07))))
   `(org-level-7 ((,class (:weight light :foreground ,berrys02 :height 1.07))))
   `(org-level-8 ((,class (:weight light :foreground ,berrys02 :height 1.07))))
   `(org-link ((,class (:foreground ,berrys03 :inherit unspecified :underline t))))
   `(org-mode-line-clock ((,class (:inherit mode-line))))
   `(org-mode-line-clock-overrun ((,class (:foreground ,berrys09))))
   `(org-priority ((,class(:inherit org-level-1 :foreground ,berrys05))))
   `(org-scheduled ((,class (:foreground ,berrys02 :slant italic))))
   `(org-scheduled-previously ((,class (:foreground ,berrys10 :slant italic))))
   `(org-scheduled-today ((,class (:inherit org-scheduled))))
   `(org-sexp-date ((,class (:foreground ,berrys-string :slant italic))))
   `(org-special-keyword ((,class (:foreground ,berrys-string))))
   `(org-table ((,class (:foreground ,berrys02 :inherit 'fixed-pitch))))
   `(org-tag ((,class(:foreground ,berrys05))))
   `(org-time-grid ((,class (:foreground ,berrys-string :slant italic))))
   `(org-todo ((,class (:height 1.0 :foreground ,berrys10))))
   `(org-upcoming-deadline ((,class (:foreground ,berrys09 :slant italic))))
   `(org-warning ((,class (:foreground ,berrys09 :slant italic))))
   ;; `(org-verbatim ((,class (:inherit default))))
   `(org-verbatim ((,class (:foreground ,berrys02 :background "#DAF06A" :weight normal))))

   ;; Org Pomodoro
   `(org-pomodoro-mode-line ((,class (:foreground ,berrys05 :weight bold))))
   `(org-pomodoro-mode-line-break ((,class (:foreground ,berrys08 :weight bold))))
   `(org-pomodoro-mode-line-overtime ((,class (:foreground ,berrys-error :weight bold))))

   ;; => Which key
   `(which-key-key-face ((,class (:foreground ,berrys05 :weight bold))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'berrys)
(provide 'berrys-theme)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; berrys-theme.el ends here
