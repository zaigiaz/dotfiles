;; Zaigiaz Lisp file for user created functions

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

;; create a temporary buffer
(defun temp-buffer ()
  """Create a temporary buffer for text stuff"""
  (interactive)
  (switch-to-buffer (get-buffer-create "temp-buffer")))

;; for project creation, note that I might just rewrite this in elisp
;; however I really like the janet syntax and simplicity of doing things in that language, so this might be more common
;; TODO: picker-list for janet scripts
(defun make-project ()
  "make a project with folder and shit"
  (interactive)
  (shell-command "janet /home/zg/scripts/setup-project.janet" "*Messages*"))

;; use the (directory-files "~/Projects/" nil "^[^.]*$") for list of project dirs
;; use completing read for choice
;; use dired to go to chosen directory
(defun project-list-projects (proj-path)
  "list all the directories in ~/Projects"
  (interactive)
  (let ((proj-list (directory-files proj-path nil "^[^.]*$")))
  (dired (concat proj-path (completing-read "Pick a Project: " proj-list)))))

(defvar common-dir-list '("~/Downloads/" "~/dotfiles/" "~/Projects/" "~/third_party/" "~/Pictures/" "/" "~/" "~/notes/" "~/scripts/" "~/.emacs.d/"))

(defun list-common-dirs ()
  "list common directories in the system"
  (interactive)
  (dired (completing-read "Pick a dir: " common-dir-list)))
