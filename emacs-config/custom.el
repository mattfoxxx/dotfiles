(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 ;;'(elpy-rpc-python-command "python")
 '(evil-set-initial-state (quote term-mode) t)
 '(fset (quote yes-or-no-p) t)
 '(inhibit-startup-screen t)
 '(message-cite-style (quote message-cite-style-gmail))
 '(message-send-mail-function (quote message-send-mail-with-sendmail))
 '(notmuch-saved-searches
   (quote
    ((:name "inbox" :query "tag:Inbox" :key "i" :sort-order newest-first)
     (:name "admin" :query "tag:admin" :key "a" :sort-order newest-first)
     (:name "unread" :query "tag:unread" :key "u" :sort-order newest-first)
     (:name "flagged" :query "tag:flagged" :key "f")
     (:name "sent" :query "tag:sent" :key "t")
     (:name "drafts" :query "tag:draft" :key "d"))))
 '(package-selected-packages
   (quote
    (ido-ubiquitous flx-ido ido-vertical-mode helm-projectile git-gutter rainbow-delimiters company-statistics company-web salt-mode salt ranger ag calfw-ical calfw-org calfw-gcal calfw neotree evil-collection gnus-alias company-anaconda anaconda-mode py-autopep8 jedi epc flycheck magit which-key projectile org-plus-contrib powerline-evil docker-compose-mode docker-tramp dockerfile-mode helm-swoop rjsx-mode elpy evil)))
 ;;'(python-shell-interpreter "python")
 '(ring-bell-function (quote ignore))
 '(send-mail-function (quote smtpmail-send-it))
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
