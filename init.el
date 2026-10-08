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
(define-key key-translation-map (kbd "æ") (kbd "|"))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)

(setq project-vc-extra-root-markers '(".project"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package vertico
  :ensure t
  :init
  (vertico-mode))
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (completion-pcm-leading-wildcard t))
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.2)
  (corfu-cycle t))
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

(use-package haskell-mode
  :ensure t)
(use-package eglot
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'eglot-ensure)
  :custom
  (eglot-autoshutdown t)
  (eglot-confirm-server-initiated-edits nil))
