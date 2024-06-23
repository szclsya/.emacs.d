;;; init-writing.el --- various writing checker -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(le-def
  :keymaps 'normal
  "s" 'jinx-correct
  "S" 'jinx-languages)

(use-package jinx
  :hook (emacs-startup . global-jinx-mode))

(use-package langtool
  :config
  (setq langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*"))

(use-package writegood-mode
  :hook
  ((org-mode . writegood-mode)))

(provide 'init-writing)
;;; init-writing.el ends here
