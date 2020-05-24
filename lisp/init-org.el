;;; init-org.el ---  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Org-mode code block fix
(setq org-src-preserve-indentation nil
      org-edit-src-content-indentation 0)

;; Add finished timestamp when done
(setq org-log-done 'time)
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-agenda-files '("~/gtd/gtd.org"
						 "~/gtd/inbox.org"
						 "~/gtd/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(("~/gtd/gtd.org" :maxlevel . 3)
                           ("~/gtd/someday.org" :level . 1)
                           ("~/gtd/tickler.org" :maxlevel . 2)))

(provide 'init-org)

;;; init-org.el ends here
