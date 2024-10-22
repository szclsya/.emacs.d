;;; init-template.el --- Template configurations. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package tempel
  :hook
  ((conf-mode . tempel-setup-capf)
   (prog-mode . tempel-setup-capf)
   (text-mode . tempel-setup-capf))
  :bind
  (:map tempel-map
        ("TAB" . tempel-next))
  :preface
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
  :init
  (global-tempel-abbrev-mode))

(defun tempel-reload ()
  "Reload tempel templates."
  (interactive)
  (setq tempel--path-templates nil))

(provide 'init-template)
;;; init-template.el ends here
