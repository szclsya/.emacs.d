;;; init-neotree.el --- Neotree configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package neotree
  :config
  (general-def 'normal neotree-mode-map
  	"TAB" 'neotree-enter
  	"SPC" nil ;; Don't interfere with leader key
  	"q" 'neotree-hide
  	"RET" 'neotree-enter
  	"g" 'neotree-refresh
  	"n" 'neotree-next-line
  	"p" 'neotree-previous-line
  	"A" 'neotree-stretch-toggle
  	"H" 'neotree-hidden-file-toggle)
  (setq neo-smart-open t))

(provide 'init-neotree)

;;; init-neotree.el ends here
 
