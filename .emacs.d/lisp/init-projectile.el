;;; init-projectile.el --- Emasc Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Projectile configuration.
;;

;;; Code:

(use-package projectile
  :diminish
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-mode-line-prefix "")
  (setq projectile-sort-order 'recentf)
  (setq projectile-use-git-grep t)
  (setq projectile-git-submodule-command nil))

(provide 'init-projectile)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-projectile.el ends here
