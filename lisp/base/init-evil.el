;;; init-evil.el --- Evil mode configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package general)

(general-create-definer my-leader-def
  :keymaps 'override
  :prefix "SPC")

(my-leader-def
  :keymaps 'normal
  "SPC" 'hs-toggle-hiding
  "-" 'hs-hide-all
  "+" 'hs-show-all
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

  ;; Open functional modules
  "A" 'org-agenda-list
  "C" 'org-capture
  "t" 'neotree-toggle
  "p" 'projectile-command-map
  "ar" 'elfeed
  "at" 'telega)

(use-package evil
  :config
  (require 'evil)
  (evil-mode 1)
  ;; :q should kill the current buffer rather than quitting emacs entirely
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (evil-ex-define-cmd "wq" (lambda ()
							 (interactive)
							 (call-interactively 'save-buffer)
							 (call-interactively 'kill-this-buffer)))
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit)
  )


 ;; Use undo tree on every undo event
(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (define-key evil-normal-state-map (kbd "u") 'undo-tree-visualize)
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)
  )

(use-package evil-collection
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)

;;; init-evil.el ends here
