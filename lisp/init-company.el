;;; init-company.el --- company-mode configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package company
  :init
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (company-tng-configure-default))

(use-package lsp-mode
  :hook (XXX-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

(use-package company-lsp :commands company-lsp)

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package company-jedi
  :config
  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'my/python-mode-hook))

(provide 'init-company)

;;; init-company.el ends here
 
