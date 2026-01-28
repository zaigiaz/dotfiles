;; Zaigiaz Lisp file for user created functions

(defun zg/gitignore_create ()
"create a template .gitignore file"
(interactive)
(find-file ".gitignore")
(insert "# ignore all executables and personal notes\n*.exe\n*.out\n*.org")
(save-buffer)
(switch-to-buffer (other-buffer)))

(defun zg/hi-comments ()
"highlight-comments in C++ or C mode that follow '//' format"
(interactive)
(highlight-lines-matching-regexp "// " 'hi-yellow)
(highlight-lines-matching-regexp "//TODO:" 'hi-blue)
(highlight-lines-matching-regexp "//ERROR:" 'hi-red)
)

(defun zg/rm-highlights ()
"remove highlights"
(interactive)
(unhighlight-regexp t)
)

;;Create new session for studying in org mode
(defun zg/session-new(num title)
"Create a new session"
(interactive "nEnter Session Number: \nsEnter Session Title:")
(insert (format "* TODO Session %d - %s" num title)))


;; basic thing to get todos for now
(defun zg/tl()
"search through current directory and get all TODOs"
(interactive)
(compile "grep -rn TODO --exclude-dir=.git")
)



;; transparency settings
(defun zg/transparency (x)
"interactive transparency setting. 100 is normal, 
more opaque the lower you go"
(interactive "NEnter a Transparency setting [0-100]: ")
(set-frame-parameter (selected-frame) 'alpha x)
)


;;taken from tsodings config file
(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))


;; Underline TODOs
(defun underline-todos-in-buffer ()
  "Find all occurrences of \"TODO\" in the current buffer and underline them."
  (interactive)
  (save-excursion
    ;; Clear previous overlays with our marker
    (remove-overlays (point-min) (point-max) 'underline-todo t)
    (goto-char (point-min))
    (let ((case-fold-search nil)  ; make search case-sensitive
          (pattern "TODO"))
      (while (search-forward pattern nil t)
        (let ((ov (make-overlay (match-beginning 0) (match-end 0))))
          (overlay-put ov 'face '(:underline t))
          (overlay-put ov 'underline-todo t))))))



;; Minor mode to underline "TODO" occurrences live
(defvar-local underline-todo--overlays nil
  "List of overlays used to underline TODOs in the buffer.")

(defun underline-todo--clear ()
  "Remove all TODO overlays in current buffer."
  (when underline-todo--overlays
    (mapc #'delete-overlay underline-todo--overlays)
    (setq underline-todo--overlays nil)))

(defun underline-todo--update (start end _len)
  "Update TODO overlays in region between START and END (plus small context)."
  (save-excursion
    (let* ((ctx 50) ; extend region to catch nearby changes
           (beg (max (point-min) (- start ctx)))
           (fin (min (point-max) (+ end ctx)))
           (pattern "TODO"))
      ;; remove overlays that intersect region
      (setq underline-todo--overlays
            (cl-remove-if
             (lambda (ov)
               (when (and (<= (overlay-start ov) fin)
                          (>= (overlay-end ov) beg))
                 (delete-overlay ov)
                 t))
             underline-todo--overlays))
      ;; search and add overlays in region
      (goto-char beg)
      (while (search-forward pattern fin t)
        (let ((ov (make-overlay (match-beginning 0) (match-end 0))))
          (overlay-put ov 'face '(:underline t))
          (push ov underline-todo--overlays))))))

;;;###autoload
(define-minor-mode underline-todo-mode
  "Minor mode to underline TODO occurrences as you type."
  :lighter " TODO-UL"
  (if underline-todo-mode
      (progn
        (underline-todo--clear)
        ;; initial full scan
        (underline-todo--update (point-min) (point-max) 0)
        (add-hook 'after-change-functions #'underline-todo--update nil t))
    ;; disable
    (remove-hook 'after-change-functions #'underline-todo--update t)
    (underline-todo--clear)))

;; Enable globally for all buffers where you want it:
(add-hook 'prog-mode-hook #'underline-todo-mode)
;; (add-hook 'text-mode-hook #'underline-todo-mode)

;; Or enable globally in all buffers (uncomment to use)
;; (global-underline-todo-mode) ;; if you define a globalized minor mode wrapper

;; Optional: a small convenience globalized wrapper
(define-globalized-minor-mode global-underline-todo-mode
  underline-todo-mode
  (lambda () (unless (minibufferp) (underline-todo-mode 1))))
;; To enable globally, call:
;; (global-underline-todo-mode 1)
