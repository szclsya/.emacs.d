;;; init-latex.el --- LaTeX configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'lsp)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(use-package company-auctex
  :defer t)

(use-package langtool
  :config
  (setq langtool-java-classpath
        "/usr/share/languagetool:/usr/share/java/languagetool/*")
)


(provide 'init-latex)
;;; init-latex.el ends here
