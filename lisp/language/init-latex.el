;;; init-latex.el --- LaTeX configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package auctex
  :ensure nil
  :hook
  ((LaTeX-mode . visual-line-mode)
   (LaTeX-mode . flymake-mode)
   (LaTeX-mode . turn-on-reftex)
   (LaTeX-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((LaTeX-mode) "texlab")))

(use-package typst-ts-mode
  :vc (typst-ts-mode :url "https://codeberg.org/meow_king/typst-ts-mode"
		     :branch "main")
  :custom
  (typst-ts-watch-options "--open")
  (typst-ts-mode-grammar-location "/usr/lib/libtree-sitter-typst.so")
  (typst-ts-mode-enable-raw-blocks-highlight t)
  :config
  (keymap-set typst-ts-mode-map "C-c C-c" #'typst-ts-tmenu)
  :after eglot
  :hook
  ((typst-ts-hook   . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((typst-ts-mode) "tinymist")))



(provide 'init-latex)
;;; init-latex.el ends here
