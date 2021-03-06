(add-to-list 'load-path "~/git/mu/mu4e")
(require 'mu4e)
(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")
(setq mu4e-headers-skip-duplicates t)
;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)
(setq mu4e-get-mail-command "offlineimap")
(setq message-kill-buffer-on-exit t)

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.
(setq mu4e-maildir-shortcuts
      '(("/INBOX" . ?i)
        ("/[Gmail].Sent Mail" . ?s)
        ("/[Gmail].Trash" . ?t)
        ("/[Gmail].All Mail" . ?a)
        ("/[asml].All Mail" . ?m)))

;;;###autoload
(defun ora-mu4e-headers-hook ())

(define-key mu4e-view-mode-map (kbd "C--") nil)

(provide 'ora-mu4e)
