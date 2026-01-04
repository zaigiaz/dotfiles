;; TODO:
;; after that then push to github repo after you're done with everything else
;; port over monochrome-blackboard, zugg-theme, and then make zaigiaz-theme
;; I want a minimalistic theme that just uses soft green and black background
;; that only syntax highlights a little bit and nothing else

;; set font
(set-face-attribute 'default nil :font "JetBrains Mono-14")
(setq custom-file "~/.emacs.d/.emacs.custom")

;; change to ef theme
;; need to modify doric theme or make my own minimalist theme that is green and black

;; custom theme I made
(add-to-list 'load-path "~/.emacs.d/pdp11-theme.el")
(load "~/.emacs.d/pdp11-theme.el")

(add-to-list 'load-path "~/.emacs.d/zg.el")
(load "~/.emacs.d/zg.el")


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired. See`package-archive-priorities
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(setq make-backup-files nil)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

;;increase garbage collection size
(setq gc-cons-threshold #x40000000)
(setq read-process-output-max (* 1024 1024 4))

;;frame settings
(setq frame-resize-pixelwise t)
(setq frame-inhibit-implied-resize t)

;; maximize screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;scroll less janky 
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq pixel-scroll-precision-large-scroll-height 40.0)

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


;; =========================================================================================================
;; Zaigiaz Emacs Config File :: Editing and Macros  =======================================================
;; =========================================================================================================


;;custom keybindings 
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "C-c l") 'reload-init-file)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)
(global-set-key (kbd "C-c b") 'bookmark-bmenu-list)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c y") 'yank-from-kill-ring)
(global-set-key (kbd "C-,") 'rc/duplicate-line)    
(global-set-key (kbd "C-c m") 'mc/edit-lines)    
(global-set-key (kbd "C-;") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-;") 'mc/mark-all-like-this)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)
(global-set-key (kbd "C-c f") 'fzf-directory)


;; minibuffer framework
(vertico-mode)
(marginalia-mode)

;; expand region package
(use-package expand-region
  :bind ("C-'" . er/expand-region))

;;move-text package default bindings
(require 'move-text)

;;documentation and linting
;; (require 'eglot)
;; (add-hook 'prog-mode-hook 'eglot-ensure)
;; (global-eldoc-mode 1)

;;line settings and tweaks
(setq next-line-add-newlines t)
;;(line-number-mode -1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq-default truncate-lines t)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; rainbow delimiters for programming
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; completion style
(setq completion-styles '(orderless basic))

;;Enable transient mark mode
;; (transient-mark-mode)

;;reload init file
(defun reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (princ "Init-file reloaded.")
  )

;;pair compeltion
(electric-pair-mode t)

;; =========================================================================================================
;; Zaigiaz Config File :: Misc Packages ===================================================================
;; =========================================================================================================

;;golden ratio mode
(golden-ratio-mode)

;; modeline
(display-time-mode t)

;;icons 
;; (use-package nerd-icons)

;; dired mode details
(setf dired-kill-when-opening-new-dired-buffer t)
(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

;; use outline mode whenever in a txt file
;; (add-hook 'text-mode-hook 'outline-mode)

;; use cape or corfu or other completion framework

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;;competions config
(setopt enable-recursive-minibuffers t)
(setopt completion-auto-help 'always)
(setopt completions-max-height 20)
(setopt completions-format 'one-column)
(setopt completion-auto-select 'second-tab)

;; startup buffer setup 
(setq inhibit-startup-screen t)

(require 'multiple-cursors)


;; think if you want to use magit or not

(require 'pulsar)
(pulsar-global-mode 1)
(setq pulsar-delay 0.04)

;;diminish mode for modeline
(require 'diminish)
(diminish 'rainbow-delimiters-mode "")
(diminish 'auto-complete-mode "")
;;(diminish 'projectile-mode "")
(diminish 'eldoc-mode "Eldoc")
(diminish 'golden-ratio-mode "")
(diminish 'javascript-mode "JS")

;; elfeed configuration
(add-to-list 'load-path "~/.emacs.d/elfeed-config.el")
(load "~/.emacs.d/elfeed-config.el")

(add-hook 'after-init-hook
    (lambda ()
      (message "Emacs has fully loaded. This code runs after startup.")
      ;; Insert a welcome message in the *scratch* buffer displaying loading time and activated packages.
      (with-current-buffer (get-buffer-create "*scratch*")
        (insert (format
"      Emacs, a GNU text editor

    Emacs version: %s
    Loading time : %s
    Packages     : %s

 Never stop learning, if you stop learning you stop living.
"                
 (substring (emacs-version) 0 15)
 (emacs-init-time)
 (number-to-string (length package-activated-list)))))))
