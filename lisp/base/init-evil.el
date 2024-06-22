;;; init-evil.el --- Evil mode configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(le-def
  :keymaps 'normal
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
  "q" 'evil-window-delete)

(setq evil-want-keybinding nil)
(use-package evil
  :init 
  (setq evil-respect-visual-line-mode t)
  ;; Install Evil and disable C-i to jump forward to restore TAB functionality in Org mode.
  (setq evil-want-C-i-jump nil)
  :config
  (require 'evil)
  ;; :q should kill the current buffer rather than quitting emacs entirely
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (evil-ex-define-cmd "wq" (lambda ()
							 (interactive)
							 (call-interactively 'save-buffer)
							 (call-interactively 'kill-this-buffer)))
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit)
  ;; Use consult for paste from kill-ring
  (define-key evil-normal-state-map (kbd "M-y") 'consult-yank-pop)
  (define-key evil-insert-state-map (kbd "M-y") 'consult-yank-pop)

  (evil-mode 1))

 ;; Use undo tree on every undo event
(use-package undo-tree
  :custom
  (undo-tree-visualizer-timestamps t)
  :config
  (define-key evil-normal-state-map (kbd "u") 'undo-tree-visualize)
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)

  (global-undo-tree-mode))

(use-package evil-collection
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :init
  ;; use non-spaced pairs when surrounding with an opening brace
  (setq
   evil-surround-pairs-alist
   '((?\( . ("(" . ")"))
     (?\[ . ("[" . "]"))
     (?\{ . ("{" . "}"))
     (?\" . ("\"" . "\""))
     ))
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)

;;; init-evil.el ends here
