;;; init-editing.el --- Editing related settings -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Always use space instead of tabs
(setq-default indent-tabs-mode nil)

;; 4 spaces for a tab
(setq-default tab-width 4)

;; Don't beep
(setq visible-bell 1)

;; Use org-mode as default Scratch buffer mode
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "")

;; Need newline at end of file
(setq require-final-newline t)

(use-package fill-column-indicator
  :config
  (setq-default fci-rule-column 80))

;; Switched to vundo because undo-tree requires a minor mode
(use-package vundo
  :after evil
  :custom
  (vundo-compact-display t)
  (vundo-glyph-alist vundo-unicode-symbols)
  (vundo-roll-back-on-quit nil)
  :general
  (:states 'normal
        "u" 'vundo)
  (:keymaps 'vundo-mode-map
        "l" 'vundo-forward
        "h" 'vundo-backward
        "j" 'vundo-next
        "k" 'vundo-previous
        "q" 'vundo-exit))

(use-package avy
  :general
  (:states 'normal
          "s" 'evil-avy-goto-char-timer
          "f" 'evil-avy-goto-char-in-line
          "gl" 'evil-avy-goto-line
          ":" 'avy-resume))

;; Highlight TODO and FIXME
(use-package hl-todo
  :hook ((prog-mode . hl-todo-mode)))

;; Highlight current line
(use-package hl-line
  :ensure nil
  :config (global-hl-line-mode))

(provide 'init-editing)
;;; init-editing.el ends here
