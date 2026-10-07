;;; init-rust.el --- Rust Language configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package rustic
  :defer t
  :hook
  ((rust-mode rust-ts-mode) . (lambda () (require 'rustic)))
  :custom
  (rustic-lsp-client 'eglot)
  (rustic-cargo-use-last-stored-arguments t))

(use-package eglot
  :ensure nil
  :hook ((rust-mode . eglot-ensure)
         (rust-ts-mode . eglot-ensure)))

(use-package cargo
  :after rust-mode
  :hook ((rust-mode . cargo-minor-mode)))

(provide 'init-rust)
;;; init-rust.el ends here
