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
  (load-theme 'base16-tomorrow-night t))

(use-package helm
  :config
  (helm-mode 1))

(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "f" 'helm-find-files
    "b" 'helm-buffers-list
    "k" 'kill-buffer
    "n" 'next-buffer
    "N" 'previous-buffer)
  (global-evil-leader-mode))

(use-package evil
  :config
  (require 'evil)
  (evil-mode 1))

(use-package company
  :init
  (global-company-mode))

(use-package flycheck
  :init
  (global-flycheck-mode))

(provide 'init-elpa)
