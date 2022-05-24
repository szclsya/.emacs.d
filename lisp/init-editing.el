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

(use-package smartparens
  :init
  (smartparens-global-mode))

;; Highlight TODO and FIXME
(use-package hl-todo
  :ensure t
  :hook ((prog-mode . hl-todo-mode)))

(provide 'init-editing)
;;; init-editing.el ends here
