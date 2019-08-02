;;; init.el --- Custom Emacs Configuration
;;; Commentary:
;; Sources: https://github.com/kpurdon/.emacs.d
;;

;;; Code:



(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#262626"))
 '(beacon-color "#cc6666")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(fci-rule-color "#3a3a3a")
 '(package-selected-packages
   (quote
    (which-key try color-theme-modern color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow exec-path-from-shell)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-language-environment "UTF-8")

;; always install all used packages
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;;company-mode
(use-package company
  :pin melpa-stable)


(use-package mediawiki)
(use-package js2-mode)

(use-package better-defaults)

(use-package better-shell)

(use-package yaml-mode)

(use-package material-theme)
(load-theme 'material t)

(use-package flycheck)
(require 'flycheck)
;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

(use-package magit)

(use-package csharp-mode)
(use-package omnisharp)
;;omnisharp setup
;;https://github.com/OmniSharp/omnisharp-emacs
(eval-after-load
    'company
  '(add-to-list 'company-backends #'company-omnisharp))

(defun my-csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)
  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)
  (electric-pair-local-mode 1) 
  ;;csharp-mode README.md recommends this too
  ;;(electric-pair-local-mode 1) ;; Emacs 25  
  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)


(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'mixed) ;; or parenthesis or expression

(menu-bar-mode 0)

;;(global-linum-mode t) ;;line number in first column
(line-number-mode t)
(column-number-mode t)

(setq flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
(setq fortran-comment-line-start "!")
(setq fortran-comment-region "!")
(setq fortran-line-length 144)
(setq frame-background-mode (quote dark))
(setq hl-sexp-background-color "#121212")
(setq indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq js2-highlight-level 3)
(setq make-backup-files nil)

(use-package vue-html-mode)
(use-package vue-mode)




;;python setup
(use-package python)
(use-package python-mode)
(use-package py-autopep8)
(use-package elpy)

(elpy-enable)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)




(use-package company-web)
(use-package ac-php)
(use-package ac-php-core)
(use-package company-php)
(use-package php-mode)
(use-package phpcbf)


(provide 'init)
;;; init.el ends here
