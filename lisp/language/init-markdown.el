;;; init-markdown.el --- Markdown support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :custom
  (markdown-command "multimarkdown")
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(provide 'init-markdown)
;;; init-markdown.el ends here
