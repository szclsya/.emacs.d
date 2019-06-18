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

(require 'init-evil)

(require 'init-company)

(require 'init-flycheck)

(provide 'init-elpa)
