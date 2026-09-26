;; -*- lexical-binding: t; -*-

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq default-frame-alist '((fullscreen . maximized)))
(load-theme 'wombat t)
(global-display-line-numbers-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

(setq ns-right-option-modifier 'none)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t))
(use-package docker
  :ensure t
  :bind ("C-c d" . docker))
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")
(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)))
