;;; init-keybinding.el --- Keybinding Mega File -*- lexical-binding: t; -*-
;;; Commentary: All of keybindings
;;; Code:

(use-package general
  :ensure t
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
  (le-def
    :keymaps 'normal
    "za" 'profiler-start
    "zb" 'profiler-stop)
  )


(provide 'init-keybinding)
;;; init-keybinding.el ends here
