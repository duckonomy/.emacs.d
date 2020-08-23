(use-package languages
  :straight (:type built-in)
  :defer t
  :general
  ("S-SPC" 'nil)
  :init
  (set-language-environment "Korean"))

(use-package encoding
  :straight (:type built-in)
  :defer t
  :init
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8))

(provide 'core-language)
