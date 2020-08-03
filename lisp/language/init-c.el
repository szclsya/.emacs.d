;;; init-c.el --- C and C++ support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package irony
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))


(provide 'init-c)
;;; init-c.el ends here
