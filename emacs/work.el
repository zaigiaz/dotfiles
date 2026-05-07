;; file for dropping into any emacs session and getting basic editor setup

;; Font
(set-face-attribute 'default nil :font "JetBrains Mono-13")

;; Package Repo
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired. See`package-archive-priorities
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq custom-file "~/.emacs.d/.emacs.custom")

;; startup buffer setup
(setq inhibit-startup-screen t)

;; Theme
(use-package alabaster-themes
  :init
  (load-theme 'alabaster-themes-dark :no-confirm)
  )

;; user-defined functions
(add-to-list 'load-path "~/.emacs.d/zg.el")
(load "~/.emacs.d/zg.el")

(setq make-backup-files nil)
(setq read-process-output-max (* 1024 1024 4))

;;frame settings
(setq frame-resize-pixelwise t)
(setq frame-inhibit-implied-resize t)

;; maximize screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;narrow to region allowed
(put 'narrow-to-region 'disabled nil)

;;remove GUI 
(when window-system
 (menu-bar-mode -1)
 (scroll-bar-mode -1)
 (tool-bar-mode -1)
 (tooltip-mode -1))

;;only y/n
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs 'y-or-n-p)

;; track recently used files to persist sessions
;; save list every 35 minutes and exclude image files
(setq recentf-save-interval (* 35 60))
(setq recentf-exclude '("\\.\\(jpg\\|png\\|jpeg\\|gif\\)$"))
(recentf-mode t)

;; General Keybindings 
(global-set-key (kbd "C-M-n") (lambda () (interactive) (next-line 10)))
(global-set-key (kbd "C-M-p") (lambda () (interactive) (previous-line 10)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "C-c l") 'reload-init-file)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)
(global-set-key (kbd "C-c q") 'recentf)
(global-set-key (kbd "M-c") 'capitalize-word)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-,") 'rc/duplicate-line)

;; save history for minibuffer for compilation mode and extras
(savehist-mode 1)
(setq history-length 100          ;; Increase history size
      savehist-save-minibuffer-history t)

;; make sure ediff is only in one window
(use-package ediff
  :ensure nil
  :config
  ;; Ediff is virtually unusable without those.  Especially on tiling
  ;; window managers.  But even on a regular desktop environment it is
  ;; confusing and cumbersome to have the control panel in another
  ;; frame.
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(use-package vertico
  :config (vertico-mode t))

(use-package marginalia
  :config (marginalia-mode t))

;; rgrep wrapper
(use-package deadgrep
  :bind ("C-x e" . deadgrep))

;; expand region package
(use-package expand-region
  :bind ("C-'" . er/expand-region))

(use-package magit
  :bind ("C-x g" . magit))

(use-package move-text
  :bind 
  (("M-n" . move-text-down)
  ("M-p" . move-text-up)))

;; LSP server
(use-package eglot
  :config
  (setq eglot-autoshutdown t)
  (setq eglot-ignored-server-capabilities '(:inlayHintProvider)))

;;line settings and tweaks
(setq next-line-add-newlines t)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq-default truncate-lines t)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; completion style (fuzzy)
(use-package orderless
  :config
  (setq completion-styles '(orderless basic)))

;; completions framework
(use-package company
  :hook (after-init-hook . global-company-mode)
  )

;; line highlighting
(use-package pulsar
  :config
  (pulsar-global-mode 1)
  (setq pulsar-delay 0.04))

(use-package multiple-cursors
  :bind 
  (("C-;" . mc/mark-next-like-this)
  ("C-c C-;" . 'mc/mark-all-like-this)))

;;reload init file
(defun reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (princ "Init-file reloaded."))

;; dired mode details
(setf dired-kill-when-opening-new-dired-buffer t)
(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

;; consult stuff
(use-package consult
  :bind
  (("C-c s b" . consult-buffer)
  ("C-c s m" . consult-imenu-multi)
  ("C-c s i" . consult-info)
  ("C-c s n" . consult-man)))

;; window resizing
(use-package golden-ratio
  :config
  (golden-ratio-mode t)
  (setq golden-ratio-adjust 1.1)
  )


