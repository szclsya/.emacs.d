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

  "f" 'find-file
  "b" 'consult-buffer)

(setq xref-search-program 'ripgrep)

(provide 'init-buffer)
;;; init-buffer.el ends here
