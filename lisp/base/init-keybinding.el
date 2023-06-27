;;; init-keybinding.el --- Keybinding Mega File -*- lexical-binding: t; -*-
;;; Commentary: All of keybindings
;;; Code:

(defun le-open-file (path)
  (interactive)
  (find-file path))

(use-package general
  :ensure t
  :after evil
  :config
  (general-define-key
   :states '(normal insert motion emacs)
   :keymaps 'override
   :prefix-map 'le-map
   :prefix "SPC"
   :non-normal-prefix "M-SPC")

  (general-create-definer le-def
    :keymaps 'le-map
    :prefix "SPC")
  )

    ;; Define the essentials here
  (le-def
    :keymaps 'normal
  "" nil
  ;; File operation
  "f" 'find-file
  ;; Buffer operation
  "b" (general-key-dispatch 'ivy-switch-buffer
		:timeout 0.5
		"k" 'kill-buffer
		"K" 'kill-this-buffer
		"n" 'next-buffer
		"p" 'previous-buffer)

  ;; Window operation
  "h" 'evil-window-left
  "j" 'evil-window-down
  "k" 'evil-window-up
  "l" 'evil-window-right
  "L" (lambda ()
		(interactive)
		(call-interactively 'split-window-horizontally)
		(call-interactively 'evil-window-right))
  "J" (lambda ()
		(interactive)
		(call-interactively 'split-window-vertically)
		(call-interactively 'evil-window-down))
  "q" 'evil-window-delete
  )

(provide 'init-keybinding)
;;; init-keybinding.el ends here
