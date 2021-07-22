;;; init-lisp.el --- Emasc Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Basic configuration.
;;

;;; Code:

(use-package eldoc
  :ensure nil
  :diminish)

(use-package slime
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (slime-setup))

(provide 'init-lisp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lisp.el ends here
