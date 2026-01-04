;; Monochrome Blackboard Theme

;; This is a custom theme from 
;; https://github.com/cyrus-and/dotfiles/blob/master/emacs/.emacs
;; That I edited a bit more on my own to my personal taste (changed background color, comment face, made higher contrast)

;; UI and base colors
(setq my/color-accent  "#ff6000") ;;       orange accent
(setq my/background "#0C1021") ;;          blue background
(setq my/color-level-4 "#e8dbb6") ;;       foreground color
(setq my/color-level-5 "#ffffff") ;;       something
(setq my/color-black "#000000")

;; common colors
(setq my/comment-face "#d3d3d3") ;; gray comments


;;;;; BASIC FACES
(custom-set-faces
 `(default        ((t (:foreground ,my/color-level-4 :background ,my/background))))
 ;; `(link           ((t (:foreground ,my/color-cyan))))
 `(link-visited   ((t (:inherit (link) :weight normal))))
 ;; `(highlight      ((t (:foreground ,my/color-level-1 :background ,my/color-level-4))))
)


;;;;; HEADER/MODE LINE

(custom-set-faces
 `(mode-line           ((t (:foreground , my/color-black :background ,my/color-level-4))))
 `(mode-line-inactive  ((t (:inherit (mode-line)))))
 `(mode-line-highlight ((t (:background ,my/color-accent))))
 `(header-line         ((t (:inherit (mode-line))))))

;;;;; FONT LOCK

(custom-set-faces
 `(font-lock-function-name-face ((t (:weight bold))))
 `(font-lock-keyword-face ((t (:weight bold))))
 `(font-lock-variable-name-face ((t (:weight bold))))
 `(font-lock-comment-face ((t (:foreground ,my/comment-face :slant italic :bold t))))
 `(font-lock-type-face ((t (:slant italic))))
 `(font-lock-constant-face ((t (:weight bold))))
 `(font-lock-builtin-face ((t (:weight bold))))
 `(font-lock-string-face ((t (:weight bold))))
 `(font-lock-negation-char-face ((t (:weight bold))))
)

;;;;; COMPILATION

(custom-set-faces
 '(compilation-mode-line-exit ((t (:inherit (success)))))
 '(compilation-mode-line-run  ((t (:inherit (warning)))))
 '(compilation-mode-line-fail ((t (:inherit (error))))))

;;;;; OUTLINES

;; (custom-set-faces
;;  `(outline-1 (:bold t))
;;  `(outline-2 (:bold t))
;;  `(outline-3 (:bold t))
;;  `(outline-4 (:bold t))
;;  `(outline-5 (:bold t))
;;  `(outline-6 (:bold t))
;;  `(outline-7 (:bold t))
;;  `(outline-8 (:bold t)))

;;;;; TERMINAL

;; (custom-set-faces
;;  `(term-color-black   ((t (:foreground ,my/color-level-0))))
;;  `(term-color-white   ((t (:foreground ,my/color-level-5))))
;;  `(term-color-red     ((t (:foreground ,my/color-red))))
;;  `(term-color-green   ((t (:foreground ,my/color-green))))
;;  `(term-color-yellow  ((t (:foreground ,my/color-yellow))))
;;  `(term-color-blue    ((t (:foreground ,my/color-blue))))
;;  `(term-color-magenta ((t (:foreground ,my/color-magenta))))
;;  `(term-color-cyan    ((t (:foreground ,my/color-cyan)))))

;;;;; OTHERS

(custom-set-faces
 `(completions-common-part    ((t (:foreground ,my/color-level-4 :background ,my/color-accent))))
 `(cursor                     ((t (:background ,my/color-level-4))))
 `(diff-refine-changed        ((t (:extend t))))
 `(fringe                     ((t (:inherit (shadow)))))
 `(isearch-fail               ((t (:inherit (error)))))
 `(minibuffer-prompt          ((t (:inherit (bold) :foreground ,my/color-level-5))))
 `(pulse-highlight-start-face ((t (:background ,my/color-accent))))
 `(region                     ((t (:foreground ,my/color-level-4 :background ,my/color-level-5 :extend t))))
 `(secondary-selection        ((t (:foreground ,my/color-accent :background ,my/color-level-5 :extend t))))
 `(show-paren-match           ((t (:inherit (bold) :foreground ,my/color-accent))))
 `(show-paren-mismatch        ((t (:inherit (error) :inverse-video t)))))
