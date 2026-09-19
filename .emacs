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
(set-face-attribute 'default nil
                    :background "black"
                    :foreground "white")


; toolbar and display config
(tool-bar-mode -1)
(menu-bar-mode -1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)

(load-file custom-file)

										; emacs binds
(global-set-key (kbd "M-!") #'compile)
