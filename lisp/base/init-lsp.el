;;; init-lsp.el --- Language Server Procotol configuations -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package eglot
  :ensure t
  :custom
  ;; Prevent eglot status from getting too high
  (max-mini-window-height 1)
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-ignored-server-capabilities
   '(:hoverProvider
     :documentHighlightProvider
     :documentFormattingProvider
     :documentRangeFormattingProvider
     :documentOnTypeFormattingProvider
     :colorProvider)))

(use-package eglot-booster
  :vc (:fetcher github :repo jdtsmith/eglot-booster)
  :after eglot
  :config
  (if (and use-emacs-lsp-booster
           (executable-find "emacs-lsp-booster"))
      (eglot-booster-mode)))

(provide 'init-lsp)
;;; init-lsp.el ends here
