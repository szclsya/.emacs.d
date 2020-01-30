(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "f" 'helm-find-files
    "b" 'helm-buffers-list
    "k" 'kill-buffer
    "n" 'next-buffer
    "N" 'previous-buffer
    "G" 'org-agenda-list)
  (global-evil-leader-mode))

(use-package evil
  :config
  (require 'evil)
  (evil-mode 1)
  ;; :q should kill the current buffer rather than quitting emacs entirely
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit))

(provide 'init-evil)
