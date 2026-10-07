;;; init-shell.el --- Shell script configs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package fish-mode)

(use-package emacs
  :ensure nil
  :config
  (setq sh-basic-offset 4)
  (add-to-list 'auto-mode-alist '("APKBUILD" . shell-script-mode))
  ;; Use POSIX shell mode by default
  (setq sh-shell-file "/bin/sh")
  )

(provide 'init-shell)
;;; init-shell.el ends here
