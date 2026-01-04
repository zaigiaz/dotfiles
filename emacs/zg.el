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

