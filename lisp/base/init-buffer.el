;;; init-buffer.el --- buffer management and navigation -*- lexical-binding: t; -*-
;;; Commentary: Using vertico/consult
;;; Code:

(le-def
  :keymaps 'normal
  "pp" 'project-switch-project
  "pg" 'project-find-regexp
  "pf" 'project-find-file
  "pq" 'project-kill-buffers
  "pb" 'consult-project-buffer
  "pd" 'project-forget-project

  "f" 'find-file
  "F" 'affe-find
  "b" 'consult-buffer
  "s" 'affe-grep)

(setq xref-search-program 'ripgrep)

;; fuzzy searcher
(use-package affe
  :config
  ;; Manual preview key for `affe-grep'
  (consult-customize affe-grep :preview-key "M-."))

(defun affe-orderless-regexp-compiler (input _type _ignorecase)
  (setq input (cdr (orderless-compile input)))
  (cons input (apply-partially #'orderless--highlight input t)))
(setq affe-regexp-compiler #'affe-orderless-regexp-compiler)

(provide 'init-buffer)
;;; init-buffer.el ends here
