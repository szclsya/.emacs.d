;;; init-web.el --- Web related languages configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package web-mode
  :config
  (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing t))

(use-package json-mode)

(use-package sass-mode)

(use-package yaml-mode)

(provide 'init-web)

;;; init-web.el ends here
 
