;;; init-neotree.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Neotree configuration file
;;

;;; Code:

(use-package neotree
  :bind
  ("<f5>" . neotree-toggle)
  :config
  (setq neo-smart-open t))

(provide 'init-neotree)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-neotree.el ends here
