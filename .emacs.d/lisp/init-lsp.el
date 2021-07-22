;;; init-lsp.el --- Emasc Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; LSP configuration.
;; https://github.com/emacs-lsp/lsp-mode

;;; Code:

(use-package lsp-mode
  :commands lsp
  :hook
  ;;(before-save . lsp-organize-imports)
  (before-save . lsp-organize-imports)
  (before-save . lsp-format-buffer)
  :custom
  (lsp-auto-configure t)
  (lsp-ui-doc-enable nil)

  :config
  (setq lsp-enable-file-watchers t)
  (setq lsp-file-watch-threshold 1024)
  (use-package lsp-ui
    :commands lsp-ui-mode
    :config
    (setq lsp-prefer-flymake t)
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
    :preface
    (defun faaaar/toggle-lsp-ui-doc ()
      (interactive)
      (if lsp-ui-doc-mode
          (progn
            (lsp-ui-doc-mode -1)
            (lsp-ui-doc--hide-frame))
        (lsp-ui-doc-mode 1)))
    :bind
    (:map lsp-mode-map
          ("C-c C-r" . lsp-ui-peek-find-references)
          ("C-c C-j" . lsp-ui-peek-find-definitions)
          ("C-c i"   . lsp-ui-peek-find-implementation)
          ("C-c m"   . lsp-ui-imenu)
          ("C-c s"   . lsp-ui-sideline-mode)
          ("C-c d"   . faaaar/toggle-lsp-ui-doc))
    :hook
    (lsp-mode . lsp-ui-mode)))

(provide 'init-lsp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lsp.el ends here
