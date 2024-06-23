;;; init-check.el --- check-mode configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package flymake
  :ensure nil
  :hook
  ((prog-mode . flymake-mode)))

(use-package sideline-flymake
  :hook (flymake-mode . sideline-mode)
  :custom
  (sideline-flymake-display-mode 'line)
  (sideline-backends-right '(sideline-flymake)))

(use-package flymake-collection)

(provide 'init-check)
;;; init-check.el ends here
