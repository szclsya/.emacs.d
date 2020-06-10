;;; init-ivy.el --- Ivy configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq evil-want-keybinding nil)

(use-package ivy
  :init
  (ivy-mode 1)
  :config
  ;;(setq ivy-use-virtual-buffers t)

  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (dolist (k '("C-j" "C-RET"))
	(define-key ivy-minibuffer-map (kbd k) #'ivy-immediate-done)))

;; For the history feature of smex
;; This part will be used automatically by counsel
(use-package smex)

(use-package counsel
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x))

(provide 'init-ivy)

;;; init-ivy.el ends here
