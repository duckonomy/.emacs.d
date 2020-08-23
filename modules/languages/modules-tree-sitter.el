(use-package tree-sitter
  :straight (tree-sitter :type git
			 :host github
			 :repo "ubolonton/emacs-tree-sitter"
			 :files ("lisp/*.el"))
  :hook
  (tree-sitter-after-on . tree-sitter-hl-mode)
  :init
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :straight (tree-sitter-langs :type git
			       :host github
			       :repo "ubolonton/emacs-tree-sitter"
			       :files ("langs/*.el" "langs/queries"))
  :after tree-sitter)

(provide 'modules-tree-sitter)
