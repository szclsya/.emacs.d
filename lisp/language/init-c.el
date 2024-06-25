;;; init-c.el --- C and C++ support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package cc-mode
  :ensure nil
  :after eglot
  :custom
  (c-default-style "k&r")
  (c-basic-offset 4)
  :hook
  ((c-mode-hook   . eglot-ensure)
   (c++-mode-hook . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

;;(setq lsp-clients-clangd-args
;;      '("-j=8" "--query-driver=/opt/devkitpro/devkitARM/bin/arm-none-eabi-g++"))

(provide 'init-c)
;;; init-c.el ends here
