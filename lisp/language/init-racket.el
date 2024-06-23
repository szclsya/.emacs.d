;;; init-racket.el --- Racket settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package racket-mode
  :defer 2
  :general
  (:keymaps 'racket-mode-map
            "<f1>" 'racket-doc
            "<f2>" 'racket-insert-lambda
            "<f5>" 'racket-run)
  :config
  (add-hook 'racket-mode-hook 'fci-mode))

(provide 'init-racket)
;;; init-racket.el ends here
