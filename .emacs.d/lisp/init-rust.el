;;; init-rust.el --- Emasc Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Rust configuration.
;;

;;; Code:

(use-package rustic
  :init
  (setq lsp-rust-server 'rls)
  ;; (setq rustic-rustfmt-bin "~/.cargo/bin/rustfmt")
  ;; (setq rustic-format-on-save t)
  ;; (setq rust-format-show-buffer nil)

  :hook
  (rust-mode . lsp-deferred)
  :config
  (use-package cargo))


(provide 'init-rust)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-rust.el ends here
