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

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t))
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")
