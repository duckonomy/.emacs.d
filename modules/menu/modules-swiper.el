(use-package swiper
  :straight t
  :preface
  (defun bjm-swiper-recenter (&rest args)
	"Recenter display after swiper ARGS."
	(recenter))
  :bind
  ("C-S-s" . swiper-isearch)
  :config
  (general-define-key
   :prefix "C-c s"
   "i" 'swiper-isearch
   "s" 'isearch-forward
   "S" 'isearch-regexp
   "r" 'isearch-backward
   "R" 'isearch-backward-regexp
   "p" 'query-replace
   "P" 'query-replace-regexp
   "L" 'goto-line
   "l" 'avy-goto-line
   "c" 'avy-goto-char
   "C" 'avy-goto-char-2
   "w" 'avy-goto-word-0
   "W" 'avy-goto-word-1
   "SPC" 'avy-goto-word-or-subword-1
   )
  ;; advise swiper to recenter on exit
  (advice-add 'swiper :after #'bjm-swiper-recenter))

(provide 'modules-swiper)
