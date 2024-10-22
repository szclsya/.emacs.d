;;; init-completion.el --- completion stuff -*- lexical-binding: t; -*-
;;; Commentary: Using vertico/consult
;;; Code:

;;; Mini-buffer completion
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (vertico-resize nil)
  (vertico-count 12)
  :config
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package vertico-directory
  :after vertico
  :ensure nil
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word)
              ("C-<return>" . vertico-exit-input))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(le-def :keymaps 'normal "." 'embark-act)

(use-package consult
  :defer t
  :init
  (advice-add #'register-preview :override #'consult-register-window)

  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

(use-package marginalia
  :ensure t
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :hook
  (after-init . marginalia-mode))

;; Use nerd-icons because all-the-icons-completion have alignment issues
(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-default nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev 90)
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster))

(defun corfu-complete-or-insert ()
  (interactive)
  (if (>= corfu--index 0)
      (corfu-complete)
    (newline-and-indent)))

;;; In-buffer completion (code completion)
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-quit-no-match t)
  (corfu-auto-delay 0.3)
  (corfu-auto-prefix 2)
  (completion-style '(basic))
  (corfu-preselect 'directory)
  ;; Orderless
  (corfu-separator ?\s)
  ;; Tab-and-Go
  (corfu-cycle t)
  (corfu-preselect 'prompt)
  ;; popup documentation
  (corfu-popupinfo-delay 0.2)
  (text-mode-ispell-word-completion nil)
  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("RET" . corfu-complete-or-insert))
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode))

(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package treesit-auto
  :after emacs
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'nil)
  (global-treesit-auto-mode t))

(use-package emacs
  :init
  ;; See https://github.com/minad/corfu
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 5)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete
        tab-first-completion 'eol)

  ;; Emacs 28 and newer: Hide commands in M-x which do not apply to the current
  ;; mode.  Corfu commands are hidden, since they are not used via M-x. This
  ;; setting is useful beyond Corfu.
  (setq read-extended-command-predicate #'command-completion-default-include-p))

(provide 'init-completion)
;;; init-completion.el ends here
