;;; init-magit.el --- magit configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(le-def
  :keymaps 'normal
  "g" 'magit-status)

(use-package magit
  :defer 2)

(provide 'init-magit)
;;; init-magit.el ends here
