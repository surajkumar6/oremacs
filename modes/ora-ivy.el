;; -*- lexical-binding: t -*-
(require 'ivy)
(require 'counsel)
(csetq ivy-display-style 'fancy)
;; (csetq ivy-count-format "(%d/%d) ")
(csetq ivy-use-virtual-buffers t)
(csetq counsel-find-file-ignore-regexp "\\`\\.")
(define-key ivy-minibuffer-map (kbd "<return>") 'ivy-alt-done)
(define-key ivy-minibuffer-map (kbd "C-M-h") 'ivy-previous-line-and-call)
(define-key ivy-minibuffer-map (kbd "C-:") 'ivy-dired)
(define-key ivy-minibuffer-map (kbd "C-c o") 'ivy-occur)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
(when (and (version< "24.5" emacs-version)
           (eq system-type 'gnu/linux)
           (char-displayable-p ?🙒))
  (diminish 'ivy-mode " 🙒"))

(defun ivy-dired ()
  (interactive)
  (if ivy--directory
      (ivy-quit-and-run
       (dired ivy--directory)
       (when (re-search-forward
              (regexp-quote
               (substring ivy--current 0 -1)) nil t)
         (goto-char (match-beginning 0))))
    (user-error
     "Not completing files currently")))

(ivy-set-actions
 t
 '(("i" insert "insert")
   ("w" kill-new "copy")))

(setq ivy-switch-buffer-faces-alist
      '((emacs-lisp-mode . swiper-match-face-1)
        (dired-mode . ivy-subdir)
        (org-mode . org-level-4)))

(setq counsel-git-grep-cmd-default
      (concat "git --no-pager grep --full-name -n --no-color -i -e '%s' -- './*' "
              (mapconcat (lambda (x) (format "':!*.%s'" x))
                         '("htm") " ")))
(setq counsel-git-grep-projects-alist
      (list
       (cons "/home/oleh/Dropbox/source/site-lisp/"
             (concat "/home/oleh/Dropbox/source/site-lisp/etc/git-grep '%s' "
                     "/home/oleh/Dropbox/source/site-lisp "
                     "git/*"))))

(provide 'ora-ivy)
