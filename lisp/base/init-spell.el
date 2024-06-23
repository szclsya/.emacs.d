;;; init-spell.el --- spellchecker -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(le-def
  :keymaps 'normal
  "s" 'jinx-correct
  "S" 'jinx-languages)

(use-package jinx
  :hook (emacs-startup . global-jinx-mode))

(use-package langtool
  :custom
  (langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*"))

(provide 'init-spell)
;;; init-spell.el ends here
