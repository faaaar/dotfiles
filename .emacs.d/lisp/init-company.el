;;; init-company.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Company config entry file
;;

;;; Code:

(use-package company
  :diminish company-mode
  :commands company-abort
  :bind (("M-/" . company-complete)
         ("<backtab>" . company-yasnippet)
         :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         ("<backtab>" . my-company-yasnippet)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next))
  :hook (after-init . global-company-mode)
  :config
  ;; (use-package company-capf)
  (push 'company-capf company-backends)
  (setq company-tooltip-align-annotations t
	company-tooltip-limit 12
	company-idle-delay .2
	company-echo-delay 0
	company-minimum-prefix-length 2
	company-require-match nil
	company-dabbrev-ignore-case nil
	company-dabbrev-downcase nil))

(provide 'init-company)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-company.el ends here
