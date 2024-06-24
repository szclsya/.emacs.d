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

;; Evil-mode get annoyed if this line isn't loaded before itself
(setq evil-want-keybinding nil)

;; Kill this buffer reliably. Yes, 'kill-this-buufer doesn't work some time
(defun le/kill-this-buffer ()
  "Just 'kill-this-buffer' but actually reliable."
  (interactive)
  (kill-buffer (current-buffer)))

(use-package evil
  :custom
  (evil-respect-visual-line-mode t)
  ;; Install Evil and disable C-i to jump forward to restore TAB functionality in Org mode.
  (evil-want-C-i-jump nil)
  :general
  ;; Use consult for pasting from kill-ring
  (:state 'normal "M-y" 'consult-yank-pop)
  (:state 'insert "M-y" 'consult-yank-pop)
  :config
  (require 'evil)
  ;; Use `;` for evil-ex to save some shift presses
  ;; Think these are too fundamental to be changed by general.el
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)
  ;; :q should kill the current buffer rather than quitting emacs entirely
  (evil-ex-define-cmd "q" 'le/kill-this-buffer)
  (evil-ex-define-cmd "wq" (lambda ()
                             (interactive)
                             (call-interactively 'save-buffer)
                             (call-interactively 'le/kill-this-buffer)))
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit)

  (evil-mode 1))

(use-package evil-collection
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :custom
  ;; use non-spaced pairs when surrounding with an opening brace
  (evil-surround-pairs-alist
   '((?\( . ("(" . ")"))
     (?\[ . ("[" . "]"))
     (?\{ . ("{" . "}"))
     (?\" . ("\"" . "\""))
     ))
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
;;; init-evil.el ends here
