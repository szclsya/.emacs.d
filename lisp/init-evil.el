(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "f" 'find-file
    "b" 'ivy-switch-buffer
    "k" 'kill-buffer
    "n" 'next-buffer
    "N" 'previous-buffer
    "G" 'org-agenda-list
	"R" 'elfeed)
  (global-evil-leader-mode))

(use-package evil
  :config
  (require 'evil)
  (evil-mode 1)
  ;; :q should kill the current buffer rather than quitting emacs entirely
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (evil-ex-define-cmd "wq" 'save-buffer)
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit))

(use-package evil-collection
  :config
  (evil-collection-init))

(provide 'init-evil)
