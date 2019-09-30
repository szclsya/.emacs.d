;; Org-mode code block fix
(setq org-src-preserve-indentation nil
      org-edit-src-content-indentation 0)

;; GTD stuff
(setq org-agenda-files '("~/gtd/gtd.org"))
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")))
(provide 'init-org)
