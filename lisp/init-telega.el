(use-package telega
  :config
  (evil-make-overriding-map telega-chat-mode-map 'normal)
  (unbind-key "i" telega-msg-button-map) ;; Evil!
  (unbind-key "l" telega-msg-button-map) ;; Evil!
  (unbind-key "k" telega-msg-button-map) ;; Evil!
)

(provide 'init-telega)
