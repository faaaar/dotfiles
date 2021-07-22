;;; init-vcs.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; vcs configruation
;;

;;; Code:

(use-package magit
  :bind
  ("C-x g" . magit-status))

;; Pop up last commit information of current line
(use-package git-messenger
  :bind (:map vc-prefix-map
              ("p" . git-messenger:popup-message)
              :map git-messenger-map
              ("m" . git-messenger:copy-message))
  :init
  ;; Use magit-show-commit for showing status/diff commands
  (setq git-messenger:use-magit-popup t))


;; Resolve diff3 conflicts
(use-package smerge-mode
  :ensure nil
  :diminish)

;; Git related modes
(use-package gitattributes-mode)
(use-package gitconfig-mode)
(use-package gitignore-mode)

(provide 'init-vcs)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-vcs.el ends here
