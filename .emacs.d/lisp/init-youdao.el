;;; init-youdao.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Youdao config
;;

;;; Code:

(use-package youdao-dictionary
  :bind
  ("C-c y" . youdao-dictionary-search-at-point)
  :config
  (setq url-automatic-caching t))

(provide 'init-youdao)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-youdao.el ends here
