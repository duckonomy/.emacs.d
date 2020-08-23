(use-package flyspell
  :hook
  ((org-mode text-mode) . flyspell-mode)
  :config
  (defhydra hydra-flyspell (:color "#1098F7")
    "Flyspell"
    ("," flyspell-goto-next-error "Next Error")
    ("." flyspell-auto-correct-word "Auto Correct Word")
    (";" flyspell-auto-correct-previous-word "Auto Correct Previous Word")
    ("p" flyspell-correct-word-before-point "Correct Word Before Point"))

  (general-define-key
   :keymaps 'flyspell-mode-map
   "C-c $" 'hydra-flyspell/body)
  )

(provide 'modules-flyspell)
