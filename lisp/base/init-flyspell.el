;;; init-flyspell.el --- flyspell configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package flyspell
  :config
  (setq flyspell-issue-message-flag nil)
  (setq ispell-program-name "hunspell")
  )

(provide 'init-flyspell)

;;; init-flyspell.el ends here
 
