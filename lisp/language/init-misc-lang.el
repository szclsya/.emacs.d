;;; init-misc-lang.el --- Misc languages support -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package fish-mode)
(use-package nginx-mode)

(use-package flymake-shellcheck
  :hook
  ((sh-mode . flymake-shellcheck-load)))

(provide 'init-misc-lang)
;;; init-misc-lang.el ends here
