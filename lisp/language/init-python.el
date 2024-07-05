;;; init-python.el --- Python language configuration -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package python-mode
  :ensure nil
  :after eglot
  :custom
  (python-shell-interpreter "python3")
  :hook
  ((python-mode-hook . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((python-mode) "pyright-langserver")))

;; (use-package lsp-pyright
;;   :defer t
;;   :ensure t
;;   :hook
;;   (python-mode . (lambda ()
;;                    (require 'lsp-pyright)
;;                    (eglot-ensure))))

(provide 'init-python)
;;; init-python.el ends here
