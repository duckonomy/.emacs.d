;; ;; Put this somewhere in auctex
;; (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)


(use-package tex-site
  ;; :straight (:type built-in)
  :straight auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq-default TeX-auto-save t)
  (setq-default TeX-parse-self t)
  (setq-default TeX-save-query nil)
  (setq-default TeX-PDF-mode t)
  (setq-default TeX-master nil)
  (setq-default TeX-view-program-selection '((output-pdf "pdf-tools"))
		TeX-source-correlate-start-server t)
  (setq-default TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
  :hook
  ((LaTex-mode . (lambda ()
		   (rainbow-delimiters-mode)
		   (company-mode)
		   (smartparens-mode)
		   (turn-on-reftex)
		   (setq-default reftex-plug-into-AUCTeX t)
		   (reftex-isearch-minor-mode)
		   (setq-default TeX-PDF-mode t)
		   (setq-default TeX-source-correlate-method 'synctex)
		   (setq-default TeX-source-correlate-start-server t)))
   (TeX-after-Tex-LaTeX-command-finished . Tex-revert-document-buffer)
   (LaTeX-mode . pdf-tools-install)))

(use-package reftex
  :straight t
  :config
  (setq reftex-cite-prompt-optional-args t))

;; (use-package ivy-bibtex
;;   :straight t
;;   :general
;;   ("C-c b b" 'ivy-bibtex)
;;   :config
;;   (setq bibtex-completion-bibliography
;;         '("C:/Users/Nasser/OneDrive/Bibliography/references-zot.bib"))
;;   (setq bibtex-completion-library-path
;;         '("C:/Users/Nasser/OneDrive/Bibliography/references-pdf"
;;           "C:/Users/Nasser/OneDrive/Bibliography/references-etc"))
;;   ;; using bibtex path reference to pdf file
;;   (setq bibtex-completion-pdf-field "File")
;;   ;;open pdf with external viwer foxit
;;   (setq bibtex-completion-pdf-open-function
;;         (lambda (fpath)
;;           (call-process "C:\\Program Files (x86)\\Foxit Software\\Foxit Reader\\FoxitReader.exe" nil 0 nil fpath)))
;;   (setq ivy-bibtex-default-action 'bibtex-completion-insert-citation))

(provide 'modules-latex)
