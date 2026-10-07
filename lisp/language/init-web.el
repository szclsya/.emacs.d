;;; init-web.el --- Web related languages configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package web-mode
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-enable-auto-pairing t)
  (web-mode-engines-alist '(("go" . "\\.html\\'")))
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(setq js-indent-level 2)

(use-package js2-mode
  :defer t)

(use-package typescript-mode
  :defer t)

(use-package json-mode
  :defer t)

(use-package sass-mode
  :defer t)

(use-package yaml-mode
  :defer t)

(provide 'init-web)
;;; init-web.el ends here
