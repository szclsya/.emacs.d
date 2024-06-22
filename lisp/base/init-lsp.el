;;; init-lsp.el --- Language Server Procotol configuations -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package lsp-mode
  :defer 1
  :custom
  (lsp-completion-provider :none) ;; we use Corfu!
  :init
  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(flex))) ;; Configure flex
  :hook
  (typescript-mode . lsp-deferred)
  (python-mode . lsp-deferred)
  (js2-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
  (lsp-completion-mode . my/lsp-mode-setup-completion)
  :commands
  (lsp lsp-deferred)
  )

(use-package lsp-ui
  :defer 1
  :config
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover t)
  ;; No giant hover box plz
  (setq lsp-ui-doc-enable nil)
  ;; No function description
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  )

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(provide 'init-lsp)
;;; init-lsp.el ends here
 
