;;; init-rust.el --- Rust Language configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package rust-mode)

(use-package flycheck-rust
  :config (with-eval-after-load 'rust-mode
			(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
)

(provide 'init-rust)

;;; init-rust.el ends here
 
