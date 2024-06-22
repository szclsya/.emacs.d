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

(provide 'init-lsp)
;;; init-lsp.el ends here
 
