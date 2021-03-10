;;; init-flyspell.el --- flyspell configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package flyspell
  :config
  (setq flyspell-issue-message-flag nil)
  (setq ispell-program-name "hunspell")
  (add-hook 'text-mode-hook
            'flyspell-mode)
  (add-hook 'prog-mode-hook
            'flyspell-prog-mode)
  )

(provide 'init-flyspell)

;;; init-flyspell.el ends here
 
