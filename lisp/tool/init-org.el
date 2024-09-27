;;; init-org.el --- Org-mode and GTD configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(le-def
  :keymaps 'normal
  "og" (lambda ()
		 (interactive)
		 (find-file "~/doc/gtd/gtd.org"))
  "os" (lambda ()
         (interactive)
         (switch-to-buffer "*scratch*"))
  "oc" 'org-capture
  "oa" 'org-agenda)

(use-package org
  :ensure nil
  :general
  (:states 'normal :keymaps 'org-mode-map
           "D" 'org-deadline
           "S" 'org-schedule
           "t" 'org-todo
           "R" 'org-refile
           "C-l" 'org-shiftmetaright
           "C-h" 'org-shiftmetaleft)
  :custom
  ;; Org-mode code clock fix
  (org-src-preserve-indentation nil)
  (org-edit-src-content-indentation 0)
  (org-highlight-latex-and-related '(latex script entities))
  ;; Add finished timestamp when done
  (org-log-done 'time)
  (org-todo-keywords '((sequence "TODO(t)" "ONGOING(o)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
  ;; Please only consider it "tomorrow" after 3AM
  (org-extend-today-until 3)
  ;; Rest
  (org-todo-keyword-faces
   '(("TODO" . (:foreground "red" :weight "bold"))
     ("WAITING" . (:foreground "red" :weight "bold"))
     ("WAITING" . (:foreground "orange" :weight "bold"))
     ("DONE" . (:foreground "green" :weight "bold"))
     ("CANCELLED" . (:background "grey" :foreground "black"))))
  (org-agenda-files '("~/doc/gtd/gtd.org"))
  (org-capture-templates
   '(("t" "Todo [inbox]" entry
      (file+headline "~/doc/gtd/gtd.org" "Inbox")
      "* TODO %i%?")
     ("T" "Tickler" entry
      (file+headline "~/doc/gtd/gtd.org" "Tickler")
      "* %i%? \n %U")))
  (org-refile-targets
   '(("~/doc/gtd/gtd.org" :maxlevel . 3)
     ("~/doc/gtd/archive.org" :maxlevel . 2)
     )))

(provide 'init-org)
;;; init-org.el ends here
