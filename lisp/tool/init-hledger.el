;;; init-hledger.el --- hledger mode  -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(le-def
  :keymaps 'normal
  "mm" (lambda ()
		 (interactive)
		 (find-file "~/Documents/ledger/current.journal"))
  "mc" 'hledger-capture)

(use-package hledger-mode
  :mode ("\\.journal\\'" "\\.hledger\\'")
  :bind (("C-c j" . hledger-run-command)
         :map hledger-mode-map
         ("C-c e" . hledger-jentry)
         ("M-p" . hledger/prev-entry)
         ("M-n" . hledger/next-entry))
  :preface
  (defun hledger/next-entry ()
    "Move to next entry and pulse."
    (interactive)
    (hledger-next-or-new-entry)
    (hledger-pulse-momentary-current-entry))


  (defun hledger/prev-entry ()
    "Move to last entry and pulse."
    (interactive)
    (hledger-backward-entry)
    (hledger-pulse-momentary-current-entry))
  :init
  (setq hledger-jfile
        (expand-file-name "~/Documents/ledger/current.journal"))
  :config
  (add-to-list 'company-backends 'hledger-company)
  (setq hledger-currency-string "$")
  )

(use-package hledger-input
  :pin manual
  :load-path "packages/rest/hledger-mode/"
  :config
  (setq hledger-input-buffer-height 20)
  (add-hook 'hledger-input-post-commit-hook #'hledger-show-new-balances)
  (add-hook 'hledger-input-mode-hook #'auto-fill-mode)
  (add-hook 'hledger-input-mode-hook
            (lambda ()
              (make-local-variable 'company-idle-delay)
              (setq-local company-idle-delay 0.1))))
(provide 'init-hledger)
;;; init-hledger.el ends here
