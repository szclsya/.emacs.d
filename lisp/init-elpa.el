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
  (global-company-mode))

(use-package smex
  :config
  (require 'smex)
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(use-package flycheck
  :init
  (global-flycheck-mode))

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

(use-package color-theme-sanityinc-tomorrow)

(provide 'init-elpa)
