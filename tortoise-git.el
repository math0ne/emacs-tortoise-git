;;##############################################################################
;;# Copyright (c) 2010 Aidan McQuay
;;#
;;# This work is licenced under the Creative Commons BSD License License. To
;;# view a copy of this licence, visit http://creativecommons.org/licenses/BSD/
;;# or send a letter to Creative Commons, 171 Second Street, Suite 300,
;;# San Francisco, California 94105, USA.
;;##############################################################################

;;; Commentary:
;; TortoiseGIT's front end.

(defun tortoise-git-command (command filename)
  (start-process "tortoise-git" "foo"
   "c:/Progra~1/TortoiseGit/bin/TortoiseGitProc" (concat "/command:" command) 
	   (concat "/path:" (replace-regexp-in-string "Program Files" 
           (regexp-quote "Progra~1") (expand-file-name filename))
            "")))

(defun tortoise-git-log ()
  (interactive)
  (tortoise-git-log-select (buffer-file-name)))

(defun tortoise-git-log-select (filename &optional wildcards)
  (interactive (find-file-read-args "Find file: " t))
  (tortoise-git-command "log" filename))

(defun tortoise-git-diff ()
  (interactive)
  (tortoise-git-command "diff" (buffer-file-name)))

(defun tortoise-git-blame ()
 (interactive)
 (tortoise-git-command "blame" (buffer-file-name)))

(defun tortoise-git-commit () 
  (interactive)
  (tortoise-git-command "commit" (buffer-file-name)))

(defun tortoise-git-commit-select (filename &optional wildcards)
(interactive (find-file-read-args "Find file: " t))
  (tortoise-git-command "commit" (buffer-file-name)))

(defun tortoise-git-revert ()
  (interactive)
  (tortoise-git-revert-select (buffer-file-name)))

(defun tortoise-git-revert-select (filename &optional wildcards)
  (interactive (find-file-read-args "Find file: " t))
  (tortoise-git-command "revert" filename))

(defun tortoise-git-help ()
 (interactive)
 (start-process-shell-command "tortoise-git" nil
  (concat "c:/Progra~1/TortoiseGit/bin/TortoiseGitProc /command:help")))

; add key bind
(global-set-key "\C-xgl" 'tortoise-git-log)
(global-set-key "\C-xgL" 'tortoise-git-log-select)
(global-set-key "\C-xg=" 'tortoise-git-diff)
(global-set-key "\C-xgb" 'tortoise-git-blame)
(global-set-key "\C-xgc" 'tortoise-git-commit)
(global-set-key "\C-xgC" 'tortoise-git-commit-select)
(global-set-key "\C-xgs" 'tortoise-git-repostatus)
(global-set-key "\C-xgS" 'tortoise-git-repostatus-select)
(global-set-key "\C-xgr" 'tortoise-git-revert)
(global-set-key "\C-xgR" 'tortoise-git-revert-select)
(global-set-key "\C-xgh" 'tortoise-git-help)

(provide 'tortoise-git)

;;; tortoise-git.el ends here.
