;;; init-notmuch.el --- Not much mail, hopefully-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(le-def
  :keymaps 'normal
  "mm" 'notmuch)

(use-package notmuch
  :defer t
  :commands (notmuch)
  :custom
  (notmuch-show-logo nil)
  (notmuch-hello-auto-refresh t)
  (notmuch-search-oldest-first nil)
  (notmuch-draft-folder "Drafts")
  ;; View
  (notmuch-show-height-limit 5)
  (notmuch-show-max-text-part-size 50000)
  (notmuch-tree-outline-enabled t)
  (notmuch-saved-searches
  '((:name "inbox" :query "tag:inbox and not tag:delete" :search-type tree)
    (:name "unread" :query "tag:unread" :search-type tree)
    (:name "sent" :query "tag:sent")
    (:name "drafts" :query "tag:draft")
    (:name "all mail" :query "*" :search-type tree))
  )
  ;; Tags
  (notmuch-show-all-tags-list t)
  (notmuch-message-replied-tags '("+replied"))
  (notmuch-message-forwarded-tags '("+forwarded"))
  (notmuch-show-mark-read-tags '("-unread"))
  (notmuch-draft-tags '("+draft"))
  ;; Sending
  (notmuch-always-prompt-for-sender t)
  (notmuch-identities
   '(
     ("Leo Shen <i@szclsya.me>")
     ("Leo Shen <szclsya@gmail.com>")
     ("Leo Shen <y266shen@csclub.uwaterloo.ca>")
     )
   )
  (notmuch-fcc-dirs
   '(
     ("i@szclsya.me" . "\"lecs/Sent Items\" +sent -unread -inbox")
     ("szclsya@gmail.com" . "\"gmail/[Gmail]/Sent Mail\" +sent -unread -inbox")
     ("csc" . "\"csc/Sent\" +sent -unread -inbox")
     )
   )
  :preface
  (defun notmuch-search-mark-read ()
    "toggle unread tag for message in notmuch search mode."
    (interactive)
    (if (member "unread" (notmuch-search-get-tags))
        (notmuch-search-tag (list "-unread"))
      (notmuch-search-tag (list "+unread")))
    (notmuch-search-next-thread))
  (defun notmuch-tree-mark-read ()
    "toggle unread tag for message in notmuch search mode."
    (interactive)
    (if (member "unread" (notmuch-tree-get-tags))
        (notmuch-tree-tag (list "-unread"))
      (notmuch-tree-tag (list "+unread")))
    (notmuch-tree-next-thread))
  ;; Don't forget attachments
  (defun my-notmuch-mua-empty-subject-check ()
    "Request confirmation before sending a message with empty subject"
    (when (and (null (message-field-value "Subject"))
               (not (y-or-n-p "Subject is empty, send anyway? ")))
      (error "Sending message cancelled: empty subject.")))
  :config
  ;;(setq message-sendmail-envelope-from 'header)

  (evil-define-key 'normal notmuch-hello-mode-map "m" (lambda () (interactive) (notmuch-mua-new-mail)))
  ;; Press R for reply
  (evil-define-key 'normal notmuch-search-mode-map "R" (lambda () (interactive) (notmuch-search-reply)))
  (evil-define-key 'normal notmuch-tree-mode-map "R" (lambda () (interactive) (notmuch-tree-reply)))
  (evil-define-key 'normal notmuch-show-mode-map "R" (lambda () (interactive) (notmuch-show-reply-sender)))
  ;; Press r for mark-as-read
  (evil-define-key 'normal notmuch-search-mode-map "r" 'notmuch-search-mark-read)
  (evil-define-key 'normal notmuch-tree-mode-map "r" 'notmuch-tree-mark-read)
  (add-hook 'message-send-hook 'my-notmuch-mua-empty-subject-check)
  (add-hook 'notmuch-show-hook 'balance-windows)
  )

(use-package org-msg
  :after notmuch
  :custom
  (mail-user-agent 'notmuch-user-agent)
  (org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t")
  (org-msg-default-alternatives '((new           . (text))
                                  (reply-to-html . (text html))
                                  (reply-to-text . (text))))
  (org-msg-convert-citation t)
  :config
  (org-msg-mode 1)
  )

(use-package message
  :ensure nil
  :defer 1
  :custom
  (message-default-mail-headers "Cc: \nBcc: \n")
  (message-sendmail-envelope-from 'header)
  (message-kill-buffer-on-exit t)
  (sendmail-program "/usr/bin/msmtp")
  (send-mail-function 'sendmail-send-it)
  )


(provide 'init-notmuch)
;;; init-notmuch.el ends here
