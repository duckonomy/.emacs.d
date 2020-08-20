(use-package swiper
  :ensure t
  :preface
  (defun bjm-swiper-recenter (&rest args)
	"Recenter display after swiper ARGS."
	(recenter))
  :bind
  ("C-S-s" . swiper-isearch)
  :config
  ;; advise swiper to recenter on exit
  (advice-add 'swiper :after #'bjm-swiper-recenter))

(provide 'modules-swiper)
