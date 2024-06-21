;;; init-buffer.el --- buffer management and navigation -*- lexical-binding: t; -*-
;;; Commentary: Using vertico/consult
;;; Code:

(le-def
  :keymaps 'normal
  "p" 'projectile-switch-project
  "G" 'projectile-ripgrep
  "f" 'find-file
  "F" 'consult-projectile-find-file
  "b" 'consult-buffer
  "B" 'consult-projectile-switch-to-buffer)

(use-package projectile
  :config
  (projectile-mode +1))
(use-package ripgrep)
(use-package projectile-ripgrep)
(use-package consult-projectile)

(provide 'init-buffer)
;;; init-buffer.el ends here
