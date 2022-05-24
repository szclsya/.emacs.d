;;; init-org.el --- Org-mode and GTD configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(my-leader-def
  :keymaps 'normal
  "og" (lambda ()
		 (interactive)
		 (find-file "~/Documents/gtd/gtd.org"))
  "oi" (lambda ()
		 (interactive)
		 (find-file "~/Documents/gtd/inbox.org"))
  "C" 'org-capture)

(add-hook 'org-mode-hook
          (lambda ()
            (evil-define-key 'normal org-mode-map "t" 'org-clock-in)
            (evil-define-key 'normal org-mode-map "T" 'org-clock-out)
            (evil-define-key 'normal org-mode-map "D" 'org-deadline)
            (evil-define-key 'normal org-mode-map "S" 'org-schedule)
            (evil-define-key 'normal org-mode-map "s" 'org-todo)
            (evil-define-key 'normal org-mode-map "R" 'org-refile)))

;; Org-mode code block fix
(setq org-src-preserve-indentation nil
      org-edit-src-content-indentation 0)

(setq org-highlight-latex-and-related '(latex script entities))

;; Add finished timestamp when done
(setq org-log-done 'time)
(setq org-todo-keywords '((sequence "TODO(t)" "ONGOING(o)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))


(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red" :weight "bold"))
        ("WAITING" . (:foreground "red" :weight "bold"))
        ("WAITING" . (:foreground "orange" :weight "bold"))
        ("DONE" . (:foreground "green" :weight "bold"))
        ("CANCELLED" . (:background "grey" :foreground "black"))
        ))

(setq org-agenda-files '("~/Documents/gtd/gtd.org"
						 "~/Documents/gtd/inbox.org"
						 "~/Documents/gtd/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Documents/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Documents/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(("~/Documents/gtd/gtd.org" :maxlevel . 3)
                           ("~/Documents/gtd/someday.org" :level . 1)
                           ("~/Documents/gtd/tickler.org" :maxlevel . 2)))

(provide 'init-org)

;;; init-org.el ends here
