;;; init-rust.el --- Rust Language configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package rustic
  :defer 2
  :custom
  (rustic-lsp-client 'eglot))

(provide 'init-rust)

;;; init-rust.el ends here
 
