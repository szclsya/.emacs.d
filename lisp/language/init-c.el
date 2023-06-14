;;; init-c.el --- C and C++ support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq c-default-style "k&r"
      c-basic-offset 4)

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq lsp-clients-clangd-args
      '("-j=8" "--query-driver=/opt/devkitpro/devkitARM/bin/arm-none-eabi-g++"))

(provide 'init-c)
;;; init-c.el ends here
