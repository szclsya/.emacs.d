;;; init-performance.el --- performance tools & tweaks -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package gcmh
  :config
  ;;(setopt garbage-collection-messages t)
  (setopt gcmh-high-cons-threshold (* 256 1000 1000))
  (setopt gcmh-low-cons-threshold (* 16 1000 1000))
  (setopt gcmh-idle-delay 3)
  ;;(setopt gcmh-verbose t)
  ;;(setopt gc-cons-percentage 0.2)
  (gcmh-mode 1))

(use-package esup
  :defer 3
  :pin melpa-stable
  :custom
  ;; See https://github.com/jschaf/esup/issues/85#issuecomment-1130110196
  (esup-depth 0))

(provide 'init-performance)
;;; init-performance.el ends here
