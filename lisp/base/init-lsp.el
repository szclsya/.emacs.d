;;; init-lsp.el --- Language Server Procotol configuations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


(use-package eglot
  :defer 1
  :commands (eglot)
  :custom
  ;; Prevent eglot status from getting too high
  (max-mini-window-height 1)
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-events-buffer-config (list :size 0))
  (eglot-ignored-server-capabilities
   '(:hoverProvider
     ;;:documentHighlightProvider
     :documentFormattingProvider
     :documentRangeFormattingProvider
     :documentOnTypeFormattingProvider
     :colorProvider)
   :config
   ;; Disable jsonrpc log
   (fset #'jsonrpc--log-event #'ignore)))

(use-package eglot-booster
  :vc (:fetcher github :repo "jdtsmith/eglot-booster")
  :ensure nil
  :after eglot
  :config
  (if (and use-emacs-lsp-booster
           (executable-find "emacs-lsp-booster"))
      (eglot-booster-mode)))

(provide 'init-lsp)
;;; init-lsp.el ends here
