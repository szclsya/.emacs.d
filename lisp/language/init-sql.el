;;; init-sql.el --- SQL support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package sql-indent
  :defer 2
  :hook sql-mode)

(use-package sqlup-mode
  :defer 2
  :hook sql-mode)

(provide 'init-sql)
;;; init-sql.el ends here
