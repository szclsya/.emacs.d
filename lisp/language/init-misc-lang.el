;;; init-misc-lang.el --- Misc languages support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package nginx-mode)

(use-package dockerfile-mode)

;; use tree-sitter
(use-package treesit-auto
  :after emacs
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'nil)
  (global-treesit-auto-mode t))

;; Lua. treesitter should be enough for my limited usecase
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))

(provide 'init-misc-lang)
;;; init-misc-lang.el ends here
