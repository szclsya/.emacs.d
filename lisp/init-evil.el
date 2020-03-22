(use-package general)

(general-create-definer my-leader-def
  :keymaps 'override
  :prefix "SPC")

(my-leader-def
  :keymaps 'normal
  ;; File operation
  "f" 'find-file
  ;; Buffer operation
  "b" (general-key-dispatch 'ivy-switch-buffer
		:timeout 0.5
		"k" 'kill-buffer
		"K" 'kill-this-buffer
		"n" 'next-buffer
		"p" 'previous-buffer)

  ;; Window operation
  "h" 'evil-window-left
  "j" 'evil-window-down
  "k" 'evil-window-up
  "l" 'evil-window-right
  "L" (lambda ()
		(interactive)
		(call-interactively 'split-window-horizontally)
		(call-interactively 'evil-window-right))
  "J" (lambda ()
		(interactive)
		(call-interactively 'split-window-vertically)
		(call-interactively 'evil-window-down))
  "q" 'evil-window-delete

  "G" 'org-agenda-list
  "ar" 'elfeed
  "at" 'telega)

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
