(use-package circe
  :straight t
  :hook ((circe-mode-hook . #'turn-off-smartparens-mode)
	 (circe-channel-mode-hook . #'turn-on-visual-line-mode)
	 (circe-channel-mode . enable-circe-color-nicks))
  :preface
  (defun znc-password (server)
    (require 'auth-source-pass)
    (auth-source-pass-get 'secret "chat/znc/mobsuit"))

  (defsubst +irc--pad (left right)
    (format (format "%%%ds | %%s" 13)
	    (concat "*** " left) right))
  :config
  (setq irc-debug-log t)

  (setq circe-network-options
	'(("freenode"
	   :host "irc.duckonomy.com"
	   :tls t
	   :user "mobsuit/freenode"
	   :pass znc-password
	   :port 6697)
	  ("geekshed"
	   :host "irc.duckonomy.com"
	   :tls t
	   :user "mobsuit/geekshed"
	   :pass znc-password
	   :port 6697)
	  ("unixchat"
	   :host "irc.duckonomy.com"
	   :tls t
	   :user "mobsuit/unixchat"
	   :pass znc-password
	   :port 6697)
	  ("gimpnet"
	   :host "irc.duckonomy.com"
	   :tls t
	   :user "mobsuit/gimpnet"
	   :pass znc-password
	   :port 6697)
	  ("oftc"
	   :host "irc.duckonomy.com"
	   :tls t
	   :user "mobsuit/oftc"
	   :pass znc-password
	   :port 6697)
	  ("snoonet"
	   :host "irc.duckonomy.com"
	   :tls t
	   :user "mobsuit/snoonet"
	   :pass znc-password
	   :port 6697)
	  ("rizon"
	   :host "irc.duckonomy.com"
	   :tls t
	   :user "mobsuit/rizon"
	   :pass znc-password
	   :port 6697)
	  ))

  (setq circe-default-quit-message nil
	circe-default-part-message nil
	circe-use-cycle-completion t
	circe-reduce-lurker-spam t
	circe-format-say (format "{nick:+%ss} │ {body}" 13)
	circe-format-self-say circe-format-say
	circe-prompt-string (concat (propertize ">>>" 'face 'circe-prompt-face) " ")
	circe-highlight-nick-type 'all
	circe-format-action (format "{nick:+%ss} * {body}" 13)
	circe-format-self-action circe-format-action
	circe-format-server-notice
	(let ((left "-Server-")) (concat (make-string (- 13 (length left)) ? )
					 (concat left " _ {body}")))
	circe-format-notice (format "{nick:%ss} _ {body}" 13)
	circe-format-server-topic
	(+irc--pad "Topic" "{userhost}: {topic-diff}")
	circe-format-server-join-in-channel
	(+irc--pad "Join" "{nick} ({userinfo}) joined {channel}")
	circe-format-server-join
	(+irc--pad "Join" "{nick} ({userinfo})")
	circe-format-server-part
	(+irc--pad "Part" "{nick} ({userhost}) left {channel}: {reason}")
	circe-format-server-quit
	(+irc--pad "Quit" "{nick} ({userhost}) left IRC: {reason}]")
	circe-format-server-quit-channel
	(+irc--pad "Quit" "{nick} ({userhost}) left {channel}: {reason}]")
	circe-format-server-rejoin
	(+irc--pad "Re-join" "{nick} ({userhost}), left {departuredelta} ago")
	circe-format-server-netmerge
	(+irc--pad "Netmerge" "{split}, split {ago} ago (Use /WL to see who's still missing)")
	circe-format-server-nick-change
	(+irc--pad "Nick" "{old-nick} ({userhost}) is now known as {new-nick}")
	circe-format-server-nick-change-self
	(+irc--pad "Nick" "You are now known as {new-nick} ({old-nick})")
	circe-format-server-nick-change-self
	(+irc--pad "Nick" "{old-nick} ({userhost}) is now known as {new-nick}")
	circe-format-server-mode-change
	(+irc--pad "Mode" "{change} on {target} by {setter} ({userhost})")
	circe-format-server-lurker-activity
	(+irc--pad "Lurk" "{nick} joined {joindelta} ago"))
  (setq-default circe-color-nicks-min-constrast-ratio 4.5
		circe-color-nicks-everywhere t))

(use-package circe-notifications
  :straight t
  )

(provide 'modules-irc)
