;;; init-editing.el --- Editing related settings -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Always use space instead of tabs
(setq-default indent-tabs-mode nil)

;; 4 spaces for a tab
(setq-default tab-width 4)

(setq
 ;; Don't beep
 visible-bell 1
 ;; Use org-mode as default Scratch buffer mode
 initial-major-mode 'org-mode
 initial-scratch-message ""
 ;; Need newline at end of file
 require-final-newline t
 ;; Warp by character when dealing with CJK characters
 word-wrap-by-category t)

;; Automatically refresh buffer when files change on disk
(global-auto-revert-mode 1)

;; Remove tailing whitespace on each line
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(use-package display-fill-column-indicator
  :ensure nil
  :custom (display-fill-column-indicator-column (- 120 1))
  :hook ((prog-mode . display-fill-column-indicator-mode)))

;; Switched to vundo because undo-tree requires a minor mode
(use-package vundo
  :after evil
  :custom
  ;;(vundo-compact-display t)
  (vundo-glyph-alist vundo-unicode-symbols)
  (vundo-roll-back-on-quit nil)
  :general
  (:states 'normal "u" 'vundo)
  (:keymaps 'vundo-mode-map
        "l" 'vundo-forward
        "h" 'vundo-backward
        "j" 'vundo-next
        "k" 'vundo-previous
        "q" 'vundo-exit))

(use-package avy
  :general
  (:states 'normal
          "f" 'evil-avy-goto-char-2
          ":" 'avy-resume))

;; Highlight TODO and FIXME
(use-package hl-todo
  :hook ((prog-mode . hl-todo-mode)))

;; Highlight current line
(use-package hl-line
  :ensure nil
  :config (global-hl-line-mode))

;; Highlight current symbol throughout buffer
(use-package highlight-symbol
  :defer 1
  :custom (highlight-symbol-idle-delay 0.5)
  :hook ((prog-mode . highlight-symbol-mode)))

;; Indentation aid
(use-package indent-bars
  :defer 3
  :hook ((python-mode yaml-mode) . indent-bars-mode)
  ;; Below are for tree-sitter
  :config
  (require 'indent-bars-ts)
  :custom
  (indent-bars-treesit-support t)
  (indent-bars-treesit-ignore-blank-lines-types '("module"))
  ;; Add other languages as needed
  (indent-bars-treesit-scope '((python function_definition class_definition for_statement
	  if_statement with_statement while_statement))))

(provide 'init-editing)
;;; init-editing.el ends here
