;;; init-projectile.el --- Projectile configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(le-def
  :keymaps 'normal
  "p" 'projectile-command-map
  "G" 'projectile-ripgrep)

(use-package projectile
  :config
  (projectile-mode +1))

(use-package ripgrep)

(use-package projectile-ripgrep)

(provide 'init-projectile)
;;; init-projectile.el ends here
 
