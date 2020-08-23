(use-package languages
  :defer t
  :bind
  ("S-SPC" . nil)
  :init
  (set-language-environment "Korean")
  )

(use-package encoding
  :defer t
  :init
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  )

(provide 'core-language)
