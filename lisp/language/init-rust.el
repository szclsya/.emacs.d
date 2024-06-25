;;; init-rust.el --- Rust Language configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package rust-mode
  :commands (rust-mode)
  :defer 2
  ;; treesitter isn't ready with rust yet
  ;;:custom
  ;;(rust-mode-treesitter-derive t)
  :hook
  ((rust-mode . eglot-ensure)))

(use-package cargo
  :after rust-mode
  :hook ((rust-mode . cargo-minor-mode)))

(provide 'init-rust)
;;; init-rust.el ends here
