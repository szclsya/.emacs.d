;;; init-shell.el --- Shell script configs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package fish-mode)

(use-package emacs
  :ensure nil
  :config
  (setq sh-basic-offset 2)
  )

(use-package flymake-shellcheck
  :hook
  ((sh-mode . flymake-shellcheck-load)))

(provide 'init-shell)
;;; init-shell.el ends here
