;; Set up environment for use-package
(package-initialize)
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Automatically install
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package base16-theme
  :config
    (load-theme 'base16-tomorrow-night t)
)

;; (use-package helm
;;   :config
;;   (require 'helm-config)
;;   (global-set-key (kbd "M-x") 'helm-M-x))

(use-package company
  :init
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (company-tng-configure-default))

(use-package lsp-mode
  :hook (XXX-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

(use-package company-lsp :commands company-lsp)

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package company-jedi
  :config
  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'my/python-mode-hook))

(use-package rust-mode)

(use-package smex
  :config
  (require 'smex)
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package flycheck-rust
  :config (with-eval-after-load 'rust-mode
			(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
)

(use-package flyspell
  :config
  (setq flyspell-issue-message-flag nil))

(use-package web-mode
  :config
  (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing t))

(use-package js2-mode)

(use-package sass-mode)

(use-package rust-mode)

(use-package irony
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package yaml-mode)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package graphviz-dot-mode)

(use-package elvish-mode)

(use-package cmake-mode)

(use-package color-theme-sanityinc-tomorrow)

(provide 'init-elpa)
