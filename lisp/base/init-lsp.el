;;; init-lsp.el --- Language Server Procotol configuations -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package lsp-mode
  :defer 1
  :hook
  (typescript-mode . lsp-deferred)
  (python-mode . lsp-deferred)
  (js2-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
  :commands
  (lsp lsp-deferred))

(use-package lsp-ui
  :defer 1
  :config
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover t)
  ;; No giant hover box plz
  (setq lsp-ui-doc-enable nil)
  )

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(provide 'init-lsp)
;;; init-lsp.el ends here
 
