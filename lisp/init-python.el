;;; init-python.el --- Python language configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (elpy-enable)  
  (setq elpy-rpc-backend "jedi")  
  (when (load "flycheck" t t)
	(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
	(add-hook 'elpy-mode-hook 'flycheck-mode))
  
  ;; Auto format code on save file
  (add-hook 'elpy-mode-hook (lambda ()
							  (add-hook 'before-save-hook
										'elpy-format-code nil t))))

(provide 'init-python)
;;; init-python.el ends here
 
