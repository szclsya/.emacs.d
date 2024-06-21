;;; init-performance.el --- performance tools & tweaks -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package gcmh
  :config
  ;; (setopt garbage-collection-messages t)
  (setopt gcmh-high-cons-threshold (* 512 1000 1000))
  (setopt gcmh-low-cons-threshold (* 32 1000 1000))
  (setopt gcmh-idle-delay 3)
  ;; (setopt gcmh-verbose t)
  (setopt gc-cons-percentage 0.2)
  (add-hook 'elpaca-after-init-hook #'gcmh-mode))

(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(benchmark-init/activate)

(provide 'init-performance)
;;; init-performance.el ends here

