;;; init-pdf-tools.el --- pdf-tools configurations -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package pdf-tools
  :pin melpa-stable
  :config
  (evil-set-initial-state 'pdf-view-mode 'normal)
)

(provide 'init-pdf-tools)
;;; init-pdf-tools.el ends here
 
