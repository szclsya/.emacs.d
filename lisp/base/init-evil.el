;;; init-evil.el --- Evil mode configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package evil
  :init 
  (setq evil-respect-visual-line-mode t)
  ;; Install Evil and disable C-i to jump forward to restore TAB functionality in Org mode.
  (setq evil-want-C-i-jump nil)
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
