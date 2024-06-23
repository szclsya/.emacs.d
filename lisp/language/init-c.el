;;; init-c.el --- C and C++ support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq c-default-style "k&r"
      c-basic-offset 4)

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(setq lsp-clients-clangd-args
      '("-j=8" "--query-driver=/opt/devkitpro/devkitARM/bin/arm-none-eabi-g++"))

(provide 'init-c)
;;; init-c.el ends here
