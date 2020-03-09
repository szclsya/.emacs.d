(setq evil-want-keybinding nil)

(use-package ivy
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)

  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (dolist (k '("C-j" "C-RET"))
	(define-key ivy-minibuffer-map (kbd k) #'ivy-immediate-done))
  )

(provide 'init-ivy)
