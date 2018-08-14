(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window-mode enhancements
(if window-system
    (progn
      ;; Frame Size and Position at Startup
      (add-to-list 'default-frame-alist '(height . 36))
      (add-to-list 'default-frame-alist '(width . 110))
      (setq initial-frame-alist '((left . 220) (top . 65)))
      ;; Klick-Kram entfernen:
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; Das Menü soll immer ausgeblendet sein
(menu-bar-mode -1)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file "~/git/dotfiles/emacs-config/emacs-config.org")
