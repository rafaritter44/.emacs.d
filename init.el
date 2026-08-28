;; -*- lexical-binding: t; -*-

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq default-frame-alist '((fullscreen . maximized)))
(load-theme 'wombat t)
(global-display-line-numbers-mode 1)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
