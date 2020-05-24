;;; init-tex.el --- TeX configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq-default TeX-engine 'xetex)
(setq-default TeX-PDF-mode t)

(provide 'init-tex)

;;; init-tex.el ends here
