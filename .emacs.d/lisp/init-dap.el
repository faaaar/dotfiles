;;; dap-mode
(use-package dap-mode
  :hook (prog-mode . dap-mode)
  :requires (hydra dap-hydra)
  :commands (dap-debug dap-debug-edit-template)
  :config
  (dap-mode t)
  (dap-ui-mode t)
  (dap-ui-controls-mode t))

(provide 'init-dap)
