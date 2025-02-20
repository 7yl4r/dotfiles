(global-display-line-numbers-mode t)
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

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" "\\.yaml\\'"))

;; Install ESS if not already installed
(unless (package-installed-p 'ess)
  (package-install 'ess))

;; ESS R mode settings
(setq ess-default-style 'RStudio)
(setq ess-indent-offset 2)
