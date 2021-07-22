;;; init-ui.el --- Emasc Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; WakaTime
;;

;;; Code:
;; package repo: https://github.com/wakatime/wakatime-mode
;; Install wakatime-mode for Emacs using MELPA.
;; Install wakatime-cli with pip install wakatime.
;; Add (global-wakatime-mode) to your init.el file, then restart Emacs.
;; You will see a prompt asking for the path to wakatime-cli. Run which wakatime and enter that path into the emacs prompt, then press enter.
;; Enter your api key in your init.el or ~/.wakatime.cfg file.
;; Use Emacs with wakatime-mode turned on and your time will be tracked for you automatically.
;; Visit http://wakatime.com to see your logged time.
(use-package wakatime-mode
  :config
  (setq wakatime-api-key (exec-path-from-shell-getenv "WAKATIME_API_KEY")))


(provide 'init-wakatime)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-vcs.el ends here
