;;; init-template.el --- Template configurations. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(le-def
  :keymaps 'normal
  "t" 'templ-complete)

(use-package tempel
  :defer 1
  :custom
  ;;(templ-trigger-prefix "<")
  (templ-path (expand-file-name "templates/*.eld" user-emacs-directory))
  :init
  (global-tempel-abbrev-mode)

  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also configure `tempel-trigger-prefix', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried first.
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'fundamental-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)
  )

(provide 'init-template)

;;; init-template.el ends here
