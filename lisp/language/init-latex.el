;;; init-latex.el --- LaTeX configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(add-to-list 'eglot-server-programs '((LaTeX-mode) "texlab"))
(add-hook 'LaTeX-mode-hook 'eglot-ensure)

(use-package langtool
  :custom
  (langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*"))

(provide 'init-latex)
;;; init-latex.el ends here
