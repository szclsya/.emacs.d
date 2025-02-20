;;; init-shell.el --- Shell script configs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package fish-mode)

(use-package emacs
  :ensure nil
  :config
  (setq sh-basic-offset 4)
  (add-to-list 'auto-mode-alist '("APKBUILD" . shell-script-mode))
  (add-hook 'sh-mode-hook 'whitespace-mode)
  ;; Use POSIX shell mode by default
  (setq sh-shell-file "/bin/sh")
  )


(use-package flymake-shellcheck
  :hook
  ((sh-mode . flymake-shellcheck-load)))

(provide 'init-shell)
;;; init-shell.el ends here
