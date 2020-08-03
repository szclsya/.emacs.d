;;; init-company.el --- company-mode configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package company
  :init
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (company-tng-configure-default))

(provide 'init-company)

;;; init-company.el ends here
 
