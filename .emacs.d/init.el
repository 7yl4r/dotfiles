(setq package-gnupghome-dir "~/.gnupg")

;; Global settings
(show-paren-mode 1)
(global-font-lock-mode 1)
(global-hl-line-mode 1)

;; Initialize package sources
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure package list is up-to-date
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if it's not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Make sure use-package is always loaded
(eval-when-compile
  (require 'use-package))

;; Use an earthy theme: Zenburn
(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

;; YAML mode for .yml and .yaml files
(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" "\\.yaml\\'"))

;; Install ESS if not already installed
(unless (package-installed-p 'ess)
  (package-install 'ess))

;; ESS R mode settings
(setq ess-default-style 'RStudio)
(setq ess-indent-offset 2)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(ess yaml-mode zenburn-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
