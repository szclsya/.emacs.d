;;; init-misc-lang.el --- Misc languages support -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package fish-mode)
(use-package nginx-mode)

(use-package flymake-shellcheck
  :hook
  ((sh-mode . flymake-shellcheck-load)))

;; Lua. treesitter should be enough for my limited usecase
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))

(provide 'init-misc-lang)
;;; init-misc-lang.el ends here
