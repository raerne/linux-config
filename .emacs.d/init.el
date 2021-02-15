(setq c-default-style "linux")

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; disable some defaults
(setq inhibit-startup-screen t)
(tool-bar-mode -1)

;; load theme
(use-package atom-one-dark-theme 
  :ensure t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/atom-one-dark-theme/")
(load-theme 'atom-one-dark t)

;; use space for tabs
(setq-default indent-tabs-mode nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

;; Setup company mode backend
(use-package company
  :ensure t
  :config (add-hook 'after-init-hook 'global-company-mode))

;; setup irony mode 
(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; setup flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package helm
  :ensure t
  :requires (helm-config))

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(helm-mode 1)

;; insteresting packages to add later
;; yasnippet

;;; init.el ends here
