;;; init-c.el --- C and C++ support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq c-default-style "k&r"
      c-basic-offset 4)

(add-hook 'c-mode-hook 'eglot)
(add-hook 'c++-mode-hook 'eglot)

(setq lsp-clients-clangd-args
      '("-j=8" "--query-driver=/opt/devkitpro/devkitARM/bin/arm-none-eabi-g++"))

(provide 'init-c)
;;; init-c.el ends here
