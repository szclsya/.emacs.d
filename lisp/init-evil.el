(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "f" 'find-file
    "b" 'switch-to-buffer
    "k" 'kill-buffer
    "n" 'next-buffer
    "N" 'previous-buffer)
  (global-evil-leader-mode))

(use-package evil
  :config
  (require 'evil)
  (evil-mode 1))

(provide 'init-evil)
