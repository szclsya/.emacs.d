;;; init-lsp.el --- Language Server Procotol configuations -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package eglot
  :ensure t
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-extend-to-xref nil)
  (eglot-ignored-server-capabilities
   '(:hoverProvider
     :documentHighlightProvider
     :documentFormattingProvider
     :documentRangeFormattingProvider
     :documentOnTypeFormattingProvider
     :colorProvider
     :foldingRangeProvider))
  (eglot-stay-out-of '(yasnippet)))

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

(provide 'init-lsp)
;;; init-lsp.el ends here
 
