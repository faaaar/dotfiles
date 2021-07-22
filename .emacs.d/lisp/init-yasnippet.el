;;; init-yasnippet.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Some useful yasnippet
;;

;;; Code:

(use-package yasnippet
  :diminish yas-minor-mode
  :hook (after-init . yas-global-mode)
  :config (use-package yasnippet-snippets))


(provide 'init-yasnippet)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-yasnippet.el ends here
