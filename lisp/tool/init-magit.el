;;; init-magit.el --- magit configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(my-leader-def
  :keymaps 'normal
  "g" 'magit-status)

(use-package magit)

(provide 'init-magit)
  
;;; init-magit.el ends here
 
