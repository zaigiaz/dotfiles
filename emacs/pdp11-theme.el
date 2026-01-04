;; pdp-11-theme

;; This is a custom theme from 
;; https://github.com/cyrus-and/dotfiles/blob/master/emacs/.emacs
;; That I edited a bit more on my own to my personal taste (changed background color, comment face, made higher contrast)

;; its based off more retro-themed colors and what looks pleasing to my eyes

;; UI and base colors
(setq my/color-accent  "#ff6000")
(setq my/color-level-0 "#000000")
(setq my/color-level-1 "#090809")
(setq my/color-level-2 "#282A2E")
(setq my/color-level-3 "#373B41")
(setq my/color-level-4 "#e8dbb6")
(setq my/color-level-5 "#ffffff")

;; common colors
(setq my/color-red     "#ff4d4d")
(setq my/color-green   "#abb453")
(setq my/color-blue    "#59CBE8")
(setq my/color-white  "#e8dbb6")
(setq my/color-magenta "#db99cf")
(setq my/color-gray    "#707880")
(setq my/comment-face "#ff8433")


;;;;; BASIC FACES

(custom-set-faces
 `(default        ((t (:foreground ,my/color-white :background ,my/color-level-1))))
 `(link           ((t (:foreground ,my/color-blue))))
 `(link-visited   ((t (:inherit (link) :weight normal))))
 `(highlight      ((t (:foreground ,my/color-level-1 :background ,my/color-white))))
 `(isearch        ((t (:foreground ,my/color-level-1 :background ,my/color-accent))))
 `(lazy-highlight ((t (:foreground ,my/color-level-1 :background ,my/color-white))))
 `(match          ((t (:inherit (lazy-highlight)))))
 `(shadow         ((t (:foreground ,my/color-gray))))
 `(error          ((t (:foreground ,my/color-red))))
 `(warning        ((t (:foreground ,my/color-white))))
 `(success        ((t (:foreground ,my/color-green)))))

;;;;; HEADER/MODE LINE

(custom-set-faces
 `(mode-line           ((t (:foreground ,my/color-white :background ,my/color-level-1))))
 `(mode-line-inactive  ((t (:inherit (mode-line)))))
 ;; `(mode-line-highlight ((t (:background ,my/color-accent))))
 `(header-line         ((t (:inherit (mode-line))))))

;;;;; FONT LOCK

(custom-set-faces
 `(font-lock-function-name-face ((t (:inherit (bold) :foreground ,my/color-magenta))))
 `(font-lock-variable-name-face ((t (:inherit (italic) :foreground ,my/color-white))))
 `(font-lock-keyword-face       ((t (:inherit (bold) :foreground ,my/color-red))))
 `(font-lock-comment-face       ((t (:foreground ,my/comment-face))))
 `(font-lock-type-face          ((t (:foreground ,my/color-blue))))
 `(font-lock-constant-face      ((t (:foreground ,my/color-blue))))
 `(font-lock-builtin-face       ((t (:foreground ,my/color-blue))))
 `(font-lock-string-face        ((t (:foreground ,my/color-green))))
 `(font-lock-negation-char-face ((t (:inherit (default bold))))))

;;;;; COMPILATION

(custom-set-faces
 '(compilation-mode-line-exit ((t (:inherit (success)))))
 '(compilation-mode-line-run  ((t (:inherit (warning)))))
 '(compilation-mode-line-fail ((t (:inherit (error))))))

;;;;; OUTLINES

(custom-set-faces
 `(outline-1 ((t (:inherit (bold) :foreground ,my/color-blue))))
 `(outline-2 ((t (:inherit (bold) :foreground ,my/color-red))))
 `(outline-3 ((t (:inherit (bold) :foreground ,my/color-green))))
 `(outline-4 ((t (:inherit (bold) :foreground ,my/color-magenta))))
 `(outline-5 ((t (:inherit (bold) :foreground ,my/color-blue))))
 `(outline-6 ((t (:inherit (bold) :foreground ,my/color-red))))
 `(outline-7 ((t (:inherit (bold) :foreground ,my/color-green))))
 `(outline-8 ((t (:inherit (bold) :foreground ,my/color-magenta)))))

;;;;; TERMINAL

(custom-set-faces
 `(term-color-black   ((t (:foreground ,my/color-level-0))))
 `(term-color-white   ((t (:foreground ,my/color-level-5))))
 `(term-color-red     ((t (:foreground ,my/color-red))))
 `(term-color-green   ((t (:foreground ,my/color-green))))
 `(term-color-white  ((t (:foreground ,my/color-white))))
 `(term-color-magenta ((t (:foreground ,my/color-magenta))))
 `(term-color-blue    ((t (:foreground ,my/color-blue)))))

;;;;; OTHERS

(custom-set-faces
 `(completions-common-part    ((t (:foreground ,my/color-level-1 :background ,my/color-accent))))
 `(cursor                     ((t (:background ,my/color-accent))))
 `(diff-refine-changed        ((t (:extend t))))
 `(fringe                     ((t (:inherit (shadow)))))
 `(isearch-fail               ((t (:inherit (error)))))
 `(minibuffer-prompt          ((t (:inherit (bold) :foreground ,my/color-accent))))
 `(pulse-highlight-start-face ((t (:background ,my/color-accent))))
 `(region                     ((t (:foreground ,my/color-level-1 :background ,my/comment-face :extend t))))
 `(secondary-selection        ((t (:foreground ,my/color-accent :background ,my/color-level-5 :extend t))))
 `(show-paren-match           ((t (:inherit (bold) :foreground ,my/color-accent))))
 `(show-paren-mismatch        ((t (:inherit (error) :inverse-video t)))))
