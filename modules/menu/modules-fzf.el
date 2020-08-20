(use-package fzf
  :ensure nil
  :defer t
  :init
  (setenv "FZF_DEFAULT_COMMAND" "fd --type f"))

(provide 'modules-fzf)
