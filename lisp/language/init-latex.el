;;; init-latex.el --- LaTeX configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package auctex
  :defer t
  :ensure t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq-default TeX-engine 'xetex)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  ;; Use Zathrua
  (add-to-list 'TeX-view-program-selection
                 '(output-pdf "zathura"))
  )

(use-package company-auctex)

(use-package langtool
  :config
  (setq langtool-java-classpath
        "/usr/share/languagetool:/usr/share/java/languagetool/*")

;;  (setq langtool-language-tool-server-jar "/usr/share/java/languagetool/languagetool-server.jar")
  )


(provide 'init-latex)
;;; init-latex.el ends here
