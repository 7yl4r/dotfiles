;; ========================================================
;; === turn off auto-indentation
;; ========================================================
;; Disable electric indentation
(when (fboundp 'electric-indent-mode)
  (electric-indent-mode -1))

;; Disable automatic pairing and other "electric" helpers
(when (fboundp 'electric-pair-mode)
  (electric-pair-mode -1))
(when (fboundp 'electric-layout-mode)
  (electric-layout-mode -1))

;; Stop automatic reindent on newline
(setq-default electric-indent-inhibit t)
;; ========================================================
;; ========================================================
;; === scrolling with the up down keys
;; ========================================================
(global-set-key (kbd "<down>") (lambda () (interactive) (scroll-up-line)))
(global-set-key (kbd "<up>")   (lambda () (interactive) (scroll-down-line)))
;; ========================================================

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

;; scroll settings; 1-line at a time, buttery smooth.
;; requires emacs 29+
(setq scroll-step 1
      scroll-conservatively 101
      scroll-margin 0)
(pixel-scroll-precision-mode 1)

