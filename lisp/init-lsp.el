;;; init-lsp.el --- Language Server Procotol configuations -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package lsp-mode
  :hook
  (typescript-mode . lsp-deferred)
  (python-mode . lsp-deferred)
  (js2-mode . lsp-deferred)
  :commands
  (lsp lsp-deferred))

(use-package lsp-ui
  :config
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover t))

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(provide 'init-lsp)
;;; init-lsp.el ends here
 
