;;; init-python.el --- Python language configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(setq python-shell-interpreter "python3")

(use-package lsp-pyright
  :defer t
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
(provide 'init-python)
;;; init-python.el ends here
 
