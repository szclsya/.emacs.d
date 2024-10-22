;;; init-notmuch.el --- Not much mail, hopefully-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(le-def
  :keymaps 'normal
  "m" 'notmuch)

(use-package notmuch
  :defer t
  :commands (notmuch)
  :custom
  (notmuch-show-logo nil)
  (notmuch-hello-auto-refresh t)
  (notmuch-search-oldest-first nil)
  (notmuch-draft-folder "Drafts")
  ;; ====== View ======
  ;; Allow folding in tree view
  (notmuch-tree-outline-enabled t)
  (notmuch-saved-searches
   '((:name "unread" :query "tag:unread and tag:inbox" :search-type tree)
     (:name "inbox" :query "tag:inbox and not tag:deleted" :search-type tree)
     (:name "sent" :query "tag:sent")
     (:name "drafts" :query "tag:draft")
     (:name "all mail" :query "*" :search-type tree))
   )
  ;; Show text/html in favor of text/plain
  ;; https://notmuchmail.org/pipermail/notmuch/2015/020190.html
  (notmuch-multipart/alternative-discouraged '("text/plain" "text/html"))
  ;; ====== Tags ======
  (notmuch-show-all-tags-list t)
  (notmuch-message-replied-tags '("+replied"))
  (notmuch-message-forwarded-tags '("+forwarded"))
  (notmuch-show-mark-read-tags '("-unread"))
  (notmuch-draft-tags '("+draft"))
  (notmuch-archive-tags '("-inbox" "-unread"))
  ;; ====== Replying ======
  ;; Use the gmail style for citing when replying (On <Time> <Sender> wrote:)
  (message-cite-style 'message-cite-style-gmail)
  (message-citation-line-function 'message-insert-formatted-citation-line)
  ;; ====== Sending ======
  ;; Ask which sender to use
  (notmuch-always-prompt-for-sender t)
  (notmuch-identities
   '(
     ("Leo Shen <i@szclsya.me>")
     ("Leo Shen <szclsya@gmail.com>")
     ("Leo Shen <y266shen@csclub.uwaterloo.ca>")
     )
   )
  ;; The \" is necessary when using mail dir with whitespaces
  (notmuch-fcc-dirs
   '(
     ("i@szclsya.me" . "\"lecs/Sent\" +sent -unread -inbox")
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
  ;; For some reason these don't work with the ~:general~ use-package keyword
  ;; so just use the good-old ~evil-define-key~
  (evil-define-key 'normal notmuch-hello-mode-map "m" 'notmuch-mua-new-mail)
  ;; R for reply
  (evil-define-key 'normal notmuch-search-mode-map "R" 'notmuch-search-reply)
  (evil-define-key 'normal notmuch-tree-mode-map "R" 'notmuch-tree-reply-sender)
  (evil-define-key 'normal notmuch-show-mode-map "R" 'notmuch-show-reply-sender)
  ;; F for forward
  (evil-define-key 'normal notmuch-tree-mode-map "F" 'notmuch-tree-forward-message)
  (evil-define-key 'normal notmuch-show-mode-map "F" 'notmuch-show-forward-message)
  ;; r for mark-as-read
  (evil-define-key 'normal notmuch-search-mode-map "r" 'notmuch-search-mark-read)
  (evil-define-key 'normal notmuch-tree-mode-map "r" 'notmuch-tree-mark-read)
  (add-hook 'message-send-hook 'my-notmuch-mua-empty-subject-check)
  ;; Prevent show window to take up too much screen space
  (add-hook 'notmuch-show-hook 'balance-windows)
  ;; Sign messages by default.
  (add-hook 'message-setup-hook 'mml-secure-sign-pgpmime)
  )

;; Use org-mode to write HTML messages
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
  ;; Use system ~msmtp~ to send mails, because the internal smtp client kinda sucks
  (message-default-mail-headers "Cc: \nBcc: \n")
  (message-sendmail-envelope-from 'header)
  (message-kill-buffer-on-exit t)
  (sendmail-program "/usr/bin/msmtp")
  (send-mail-function 'sendmail-send-it))


(provide 'init-notmuch)
;;; init-notmuch.el ends here
