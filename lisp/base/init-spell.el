;;; init-spell.el --- spellchecker -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(le-def
  :keymaps 'normal
  "s" 'jinx-correct
  "S" 'jinx-languages)

(use-package jinx
  :hook (emacs-startup . global-jinx-mode))

(provide 'init-spell)

;;; init-spell.el ends here
