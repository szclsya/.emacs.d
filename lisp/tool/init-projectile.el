;;; init-projectile.el --- Projectile configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(my-leader-def
  :keymaps 'normal
  "p" 'projectile-command-map)

(use-package projectile
  :config
  (projectile-mode +1))

(use-package ripgrep)

(use-package projectile-ripgrep)

(provide 'init-projectile)
;;; init-projectile.el ends here
 
