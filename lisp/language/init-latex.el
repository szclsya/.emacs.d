;;; init-latex.el --- LaTeX configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package auctex
  :ensure nil
  :hook
  ((LaTeX-mode . visual-line-mode)
   (LaTeX-mode . flymake-mode)
   (LaTeX-mode . turn-on-reftex)
   (LaTeX-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((LaTeX-mode) "texlab")))

(provide 'init-latex)
;;; init-latex.el ends here
