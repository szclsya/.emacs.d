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

(use-package js2-mode
  :defer 2
  :custom
  (js-indent-level 2))

(use-package typescript-mode)

(use-package json-mode
  :defer 2
  :custom
  (js-indent-level 2))

(use-package sass-mode
  :defer 2)

(use-package yaml-mode)

(provide 'init-web)
;;; init-web.el ends here
