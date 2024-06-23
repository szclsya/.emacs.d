;;; init-completion.el --- completion stuff -*- lexical-binding: t; -*-
;;; Commentary: Using vertico/consult
;;; Code:

;;; Mini-buffer completion
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (vertico-resize nil)
  (vertico-count 9)
  :config
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package recentf
  :config
  (recentf-mode 1))

(use-package vertico-directory
  :after vertico
  :ensure nil
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package nerd-icons-corfu
  :hook
  (corfu-margin-formatter . nerd-icons-corfu-formatter))

(use-package consult)

(use-package marginalia
  :ensure t
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :config
  (marginalia-mode))

;; Use nerd-icons because all-the-icons-completion have alignment issues
(use-package nerd-icons-completion
  :after (marginalia all-the-icons)
  :hook ((marginalia-mode . nerd-icons-completion-mode))
  :config
  (nerd-icons-completion-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev 90))

;;; In-buffer completion (code completion)
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.25)
  (corfu-auto-prefix 1)
  (corfu-preselect 'directory)
  ;; Orderless
  (corfu-separator ?\s)
  ;; Tab-and-Go
  (corfu-cycle t) 
  (corfu-preselect 'prompt)
  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("RET" . corfu-complete-or-insert))
  :init
  (global-corfu-mode)
  (setq text-mode-ispell-word-completion nil))

(defun corfu-complete-or-insert ()
  (interactive)
  (if (>= corfu--index 0)
      (corfu-complete)
    (newline-and-indent)))

(use-package emacs
  :init
  ;; See https://github.com/minad/corfu
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 5)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)

  ;; Emacs 28 and newer: Hide commands in M-x which do not apply to the current
  ;; mode.  Corfu commands are hidden, since they are not used via M-x. This
  ;; setting is useful beyond Corfu.
  (setq read-extended-command-predicate #'command-completion-default-include-p))

;;; Keybinding completion
;; (use-package which-key
;;   :config
;;   (which-key-mode))

(provide 'init-completion)
;;; init-completion.el ends here
