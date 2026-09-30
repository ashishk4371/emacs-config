(setq custom-file "~/.emacs.custom.el")

; org config
(setq org-agenda-files '("~/Desktop/projects/tasks.org"))
(setq org-agenda-span '10)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c w") #'org-agenda-list)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; evil mode config
(defvar evil-mode-buffers '())
(require 'evil)
(evil-mode 1)

										; executable scripts
(let ((my-bin (expand-file-name "~/bin")))
  (setenv "PATH" (concat my-bin ":" (getenv "PATH")))
  (add-to-list 'exec-path my-bin))


					; buffers
(setq completion-cycle-threshold 5)
(setq completion-eager-display t)

										; editor
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

; themes
;(set-face-attribute 'default nil
;                    :background "black"
;                    :foreground "white")


; toolbar and display config
(tool-bar-mode -1)
(menu-bar-mode -1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)

(load-file custom-file)

; emacs binds
(global-set-key (kbd "M-!") #'compile)

;; templates
(defvar my-java-template-directory
  (expand-file-name "templates/" user-emacs-directory))
(defun my-create-java-dsa-file (file-name)
  "Create java file from DSA template"
  (interactive "FJava file name: ")

  (unless (string-suffix-p ".java" file-name)
	(setq file-name (concat file-name ".java")))

  (let* ((template-file
		  (expand-file-name
		   "JavaDSATemplate.java"
		   my-java-template-directory))
		 (class-name
		  (file-name-sans-extension
		   (file-name-nondirectory file-name))))

	;; Check that the template exists before creating the java file
	(unless (file-exists-p template-file)
	  (user-error "Tempalte not found: %s" template-file))

  (find-file file-name)

  (when (= (buffer-size) 0)
	(insert-file-contents template-file)
	(goto-char (point-min))

	(while (search-forward "{{CLASS_NAME}}" nil t)
	  (replace-match class-name t t)))

	(save-buffer)))

(global-set-key (kbd "C-c j d") #'my-create-java-dsa-file)
