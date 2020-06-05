;;; init-typescript.el --- TypeScript configurations. -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package typescript-mode)

(use-package tide
  :config
  (defun setup-tide-mode ()
	(interactive)
	(tide-setup)
	(flycheck-mode +1)
	(setq flycheck-check-syntax-automatically '(save mode-enabled))
	(eldoc-mode +1)
	(tide-hl-identifier-mode +1)
	(company-mode +1))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)

  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(provide 'init-typescript)

;;; init-typescript.el ends here
 
