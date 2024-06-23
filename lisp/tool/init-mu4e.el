;;; init-mu4e.el --- Mu4e -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

;;(require 'mu4e)

(use-package mu4e-column-faces
  :after mu4e
  :config (mu4e-column-faces-mode))

(use-package mu4e
  :ensure nil
  :general
  (:state 'normal :keymaps 'mu4e-headers-mode-map
          "r" 'mu4e-headers-mark-for-read)
  :custom
  ;; General configurations
  (mu4e-maildir (expand-file-name "~/.mail"))
  (mu4e-attachment-dir "~/Downloads/mail")
  (mu4e-use-fancy-chars t)
  (mu4e-change-filenames-when-moving t)
  (mu4e-context-policy 'pick-first)
  (mu4e-compose-context-policy 'ask)
  ;; Default mailbox context
  (user-mail-address "i@szclsya.me")
  (user-full-name "Leo Shen")
  (mu4e-sent-folder "/lecs/.Sent")
  (mu4e-drafts-folder "/lecs/.Drafts")
  (mu4e-trash-folder "/lecs/.Trash")
  ;; Mailbox contexts
  (mu4e-contexts
   `(,(make-mu4e-context
       :name "lecs"
       :match-func (lambda (msg)
                     (when msg (string-prefix-p "/lecs" (mu4e-message-field msg :maildir))))
       :vars '((mu4e-maildir (expand-file-name "~/.mail/lecs"))
               (user-mail-address  . "i@szclsya.me")
               (user-full-name     . "Leo Shen")
               (mu4e-drafts-folder . "/lecs/.Drafts")
               (mu4e-sent-folder   . "/lecs/.Sent")
               (mu4e-trash-folder  . "/lecs/.Trash")))
     ,(make-mu4e-context
       :name "gmail"
       :match-func (lambda (msg)
                     (when msg (string-prefix-p "/gmail" (mu4e-message-field msg :maildir))))
       :vars '((mu4e-maildir (expand-file-name "~/.mail/gmail"))
               (user-mail-address  . "szclsya@gmail.com")
               (user-full-name     . "Leo Shen")
               (mu4e-drafts-folder . "/gmail/.Drafts")
               (mu4e-sent-folder   . "/gmail/.Sent")
               (mu4e-trash-folder  . "/gmail/.Trash")))
     ))
  :config
  (add-hook 'mu4e-view-mode-hook #'visual-line-mode)
  )

(use-package mu4e-marker-icons)

(provide 'init-mu4e)
;;; init-mu4e.el ends here
