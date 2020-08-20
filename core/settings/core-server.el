(use-package server
  :hook
  (server-switch . (lambda () (select-frame-set-input-focus (selected-frame)))))

(provide 'core-server)
