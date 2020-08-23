(use-package isearch
  :straight (:type built-in)
  :after (general)
  :general
  (:keymaps 'isearch-mode-map
	    [escape] 'isearch-abort))

(provide 'core-isearch)
