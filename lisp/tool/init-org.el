;;; init-org.el --- Org-mode and GTD configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(le-def
  :keymaps 'normal
  "og" (lambda ()
		 (interactive)
		 (find-file "~/Documents/gtd/gtd.org"))
  "oi" (lambda ()
		 (interactive)
		 (find-file "~/Documents/gtd/inbox.org"))
  "os" (lambda ()
         (interactive)
         (switch-to-buffer "*scratch*"))
  "oc" 'org-capture)

(use-package org
  :ensure nil
  :general
  (:states 'normal :keymaps 'org-mode-map
           "t" 'org-clock-in
           "T" 'org-clock-out
           "D" 'org-deadline
           "S" 'org-schedule
           "s" 'org-todo
           "R" 'org-refile)
  :custom
  ;; Org-mode code clock fix
  (org-src-preserve-indentation nil)
  (org-edit-src-content-indentation 0)
  (org-highlight-latex-and-related '(latex script entities))
  ;; Add finished timestamp when done
  (org-log-done 'time)
  (org-todo-keywords '((sequence "TODO(t)" "ONGOING(o)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
  ;; Rest
  (org-todo-keyword-faces
   '(("TODO" . (:foreground "red" :weight "bold"))
     ("WAITING" . (:foreground "red" :weight "bold"))
     ("WAITING" . (:foreground "orange" :weight "bold"))
     ("DONE" . (:foreground "green" :weight "bold"))
     ("CANCELLED" . (:background "grey" :foreground "black"))))
  (org-agenda-files
   '("~/Documents/gtd/gtd.org"
	 "~/Documents/gtd/inbox.org"
	 "~/Documents/gtd/tickler.org"))
  (org-capture-templates
   '(("t" "Todo [inbox]" entry
      (file+headline "~/Documents/gtd/inbox.org" "Tasks")
      "* TODO %i%?")
     ("T" "Tickler" entry
      (file+headline "~/Documents/gtd/tickler.org" "Tickler")
      "* %i%? \n %U")))
  (org-refile-targets
   '(("~/Documents/gtd/gtd.org" :maxlevel . 3)
     ("~/Documents/gtd/someday.org" :level . 1)
     ("~/Documents/gtd/tickler.org" :maxlevel . 2))))

(provide 'init-org)
;;; init-org.el ends here
