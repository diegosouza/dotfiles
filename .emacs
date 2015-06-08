(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install them
(ensure-package-installed 'evil
			  'flycheck
			  'iedit
			  'powerline
			  'powerline-evil
			  'restclient
			  'expand-region
			  'markdown-mode
			  'php-mode)

(require 'evil)
(evil-mode t)
(require 'powerline)
(powerline-default-theme)
(require 'powerline-evil)
(require 'expand-region)
(global-set-key (kbd "M-S-<up>") 'er/expand-region)
(global-set-key (kbd "M-S-<down>") 'er/contract-region)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(toggle-frame-maximized)
(global-linum-mode 1)
