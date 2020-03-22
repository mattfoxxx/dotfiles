;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     copy-as-format
     php
     nginx
     yaml
     vimscript
     markdown
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (ansible :variables
              ansible-auto-encrypt-descrypt t
              ansible::vault-password-file "~/git/ansible/.vault_pass")
     auto-completion
     better-defaults
     django
     docker
     emacs-lisp
     git
     (go :variables gofmt-command "goimports")
     html
     javascript
     (markdown :variables
               markdown-live-preview-engine 'vmd
               markdown-command "/usr/bin/pandoc")
     (mu4e :variables mu4e-account-alist t)
     notmuch
     nginx
     (org :variables
          org-enable-jira-support t
          jiralib-url "https://silvertours.atlassian.net:443")
     pdf
     python
     ranger
     restclient
     salt
     shell-scripts
     (shell :variables
            shell-default-shell 'multi-term
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     terraform
     tmux
     version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ;;ewal
     ;;ewal-spacemacs-themes
     ;;ewal-evil-cursors
     vterm
     netrc
     org-gcal
     org-brain
     org-cliplink
     yasnippet-snippets
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 5)
                                (agenda . 5)
                                (todos . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative nil
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode
                                         text-mode
                                         :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;;(enable-theme 'ewal-spacemacs-modern)
  (let (vterm-install)
    (require 'vterm))
  (spacemacs/toggle-indent-guide-globally-on)
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))
  ;; (setq-default evil-escape-key-sequence "jj")
  (use-package netrc
    :ensure t)
  (defun get-authinfo-pass (host port)
    (let* ((netrc (netrc-parse (expand-file-name "~/.authinfo.gpg")))
           (hostentry (netrc-machine netrc host port port)))
      (when hostentry (netrc-get hostentry "password"))))

  (defun get-authinfo-login (host port)
    (let* ((netrc (netrc-parse (expand-file-name "~/.authinfo.gpg")))
           (hostentry (netrc-machine netrc host port port)))
      (when hostentry (netrc-get hostentry "login"))))

  (defun mm/file-string (file)
    "Read the contents of a file and return as a string."
    (with-current-buffer (find-file-noselect file)
      (buffer-string)))

  ;; (defun mu4e-message-maildir-matches (msg rx)
  ;;   (string-match rx (mu4e-message-field msg :maildir)))

  (with-eval-after-load 'mu4e
  ; Set up some common mu4e variables
    (setq mail-user-agent 'mu4e-user-agent)
    (setq mu4e-maildir "~/.mail"
          mu4e-attachment-dir "~/Downloads"
          mu4e-get-mail-command "mbsync -a"
          mu4e-update-interval 120
          mu4e-compose-signature-auto-include t
          mu4e-view-show-images t
          mu4e-change-filenames-when-moving t
          mu4e-view-show-addresses t
          ;;mu4e-contexts
          ;;`( ,(make-mu4e-context
          ;;     :name "Work"
          ;;     ;; :enter-func (lambda () (mu4e-message "Switch to the Work context"))
          ;;     ;; :leave-func (lambda () (mu4e-message "Leaving Work context"))
          ;;     ;; we match based on the maildir of the message
          ;;     ;; this matches maildir /Arkham and its sub-directories
          ;;     ;; :match-func (lambda (msg)
          ;;     ;;               (when msg
          ;;     ;;                 (string-match-p "^/gmail*" (mu4e-message-field msg :maildir))))
          ;;     ;; :match-func (lambda (msg)
          ;;     ;;               (when msg (string= (mu4e-message-field msg :maildir) "/gmail")))
          ;;     :match-func (lambda (msg) (when msg
          ;;                                 (string-prefix-p "/gmail" (mu4e-message-field msg :maildir))))
          ;;     :vars '( ( user-mail-address       . "mintert@billiger-mietwagen.de" )
          ;;              ( user-full-name          . "Matthias Mintert" )
          ;;              ( mu4e-sent-messages-behavior . delete )
          ;;              ( mu4e-sent-folder        . "/gmail/[Gmail]/Gesendet" )
          ;;              ( mu4e-drafts-folder      . "/gmail/[Gmail]/Entw&APw-rfe" )
          ;;              ( mu4e-trash-folder       . "/gmail/[Gmail]/Papierkorb" )
          ;;              ( mu4e-refile-folder      . "/gmail/[Gmail]/Alle Nachrichten" )
          ;;              ( mu4e-compose-signature  . (mm/file-string "~/.signature") )
          ;;              ;; ( mu4e-compose-signature  .
          ;;              ;;                           (concat
          ;;              ;;                            "Matthias Mintert\n"
          ;;              ;;                            "IT-Systemadministrator\n\n"
          ;;              ;;                            "www.billiger-mietwagen.de\n"
          ;;              ;;                            "www.carigami.fr\n"
          ;;              ;;                            "www.camperdays.de\n\n"
          ;;              ;;                            "SilverTours GmbH\n"
          ;;              ;;                            "Konrad-Goldmann-Straße 5d\n"
          ;;              ;;                            "79100 Freiburg\n\n"
          ;;              ;;                            "Fon + 49-761-55772540\n"
          ;;              ;;                            "Fax + 49-761-55772569\n\n"
          ;;              ;;                            "HRB: 7144 (Amtsgericht Freiburg)\n"
          ;;              ;;                            "Geschäftsführer: Daniel Puschmann\n"))
          ;;              ))
          ;;   ,(make-mu4e-context
          ;;     :name "Private"
          ;;     :enter-func (lambda () (mu4e-message "Entering Private context"))
          ;;     :leave-func (lambda () (mu4e-message "Leaving Private context"))
          ;;     ;; we match based on the contact-fields of the message
          ;;     :match-func (lambda (msg)
          ;;                   (when msg
          ;;                     (mu4e-message-contact-field-matches msg
          ;;                                                         :to "matthias@mintert.net")))
          ;;     :vars '( ( user-mail-address      . "matthias@mintert.net"  )
          ;;              ( user-full-name         . "Matthias Mintert" )
          ;;              ( mu4e-compose-signature .
          ;;                                       (concat
          ;;                                        "Alice Derleth\n"
          ;;                                        "Lauttasaari, Finland\n"))))
          ;;   )
          )

    (setq user-mail-address       "mintert@billiger-mietwagen.de"
          user-full-name          "Matthias Mintert"
          mu4e-sent-messages-behavior 'delete
          mu4e-sent-folder        "/gmail/[Gmail]/Gesendet"
          mu4e-drafts-folder      "/gmail/[Gmail]/Entw&APw-rfe"
          mu4e-trash-folder       "/gmail/[Gmail]/Papierkorb"
          mu4e-refile-folder      "/gmail/[Gmail]/Alle Nachrichten"
          ;; mu4e-compose-signature  '(mm/file-string "~/.signature")
          )

  ;; set `mu4e-context-policy` and `mu4e-compose-policy` to tweak when mu4e should
  ;; guess or ask the correct context, e.g.

  ;; start with the first (default) context;
  ;; default is to ask-if-none (ask when there's no context yet, and none match)
  ;; (setq mu4e-context-policy 'pick-first)

  ;; compose with the current context is no context matches;
  ;; default is to ask
  ;; (setq mu4e-compose-context-policy nil)


  ;; (setq mu4e-account-alist
  ;;       '(("work"
  ;;          ;; Under each account, set the account-specific variables you want.
  ;;          (mu4e-sent-messages-behavior delete)
  ;;          (mu4e-sent-folder "/gmail/[Gmail]/Gesendet")
  ;;          (mu4e-drafts-folder "/gmail/[Gmail]/Entw&APw-rfe")
  ;;          (mu4e-trash-folder "/gmail/[Gmail]/Papierkorb")
  ;;          (mu4e-refile-folder "/gmail/[Gmail]/Alle Nachrichten")
  ;;          (mu4e-compose-signature (mm/file-string "~/.signature"))
  ;;          (user-mail-address "mintert@billiger-mietwagen.de")
  ;;          (user-full-name "Matthias Mintert"))
  ;;         ("mintert"
  ;;          (mu4e-sent-messages-behavior sent)
  ;;          (mu4e-sent-folder "/mintert/Sent Items")
  ;;          (mu4e-drafts-folder "/mintert/Drafts")
  ;;          (user-mail-address "matthias@mintert.net")
  ;;          (user-full-name "Matthias Mintert"))))
  ;; (mu4e/mail-account-reset)

  ;;; Mail directory shortcuts
  (setq mu4e-maildir-shortcuts
        '(("/gmail/Inbox" . ?i)
          ("/gmail/admin" . ?a)))

  ;;; Bookmarks
  (setq mu4e-bookmarks
        `(("(flag:unread AND (maildir:\"/gmail/Inbox\" OR maildir:\"/gmail/admin\")) AND NOT flag:trashed" "Unread messages" ?u)
          ("date:today..now" "Today's messages" ?t)
          ("date:7d..now" "Last 7 days" ?w)
          ("mime:image/*" "Messages with images" ?p)
          (,(mapconcat 'identity
                       (mapcar
                        (lambda (maildir)
                          (concat "maildir:" (car maildir)))
                        mu4e-maildir-shortcuts) " OR ")
           "All inboxes" ?i)))
  (setq message-kill-buffer-on-exit t))

  ;; ;; Define two identities, "home" and "work"
  ;; (setq gnus-alias-identity-alist
  ;;       '(("home"
  ;;          nil ;; Does not refer to any other identity
  ;;          "Matthias Mintert <matthias@mintert.net>" ;; Sender address
  ;;          nil ;; No organization header
  ;;          nil ;; No extra headers - ex. (("Bcc" . "john.doe@example.com"))
  ;;          nil ;; No extra body text
  ;;          "~/.signature.home")
  ;;         ("work"
  ;;          nil
  ;;          "Matthias Mintert <mintert@billiger-mietwagen.de>"
  ;;          "SilverTours GmbH"
  ;;          (("Fcc" . "gmail/[Gmail]/Gesendet"))
  ;;          nil
  ;;          "~/.signature")))
  ;; ;; Use "home" identity by default
  ;; (setq gnus-alias-default-identity "work")
  ;; ;; Define rules to match work identity
  ;; (setq gnus-alias-identity-rules
  ;;       '(("work" ("any" "mintert@\\(billiger-mietwagen\\.de\\)" both) "work")))
  ;; ;; Determine identity when message-mode loads
  ;; (add-hook 'message-setup-hook 'gnus-alias-determine-identity)
  ;; (setq mail-specify-envelope-from "t")
  ;; (setq message-sendmail-envelope-from "header")
  ;; (setq mail-envelope-from "header")
  ;; (add-hook 'message-setup-hook 'mml-secure-sign-pgpmime)
  ;; (progn
  ;;   (require 'notmuch)
  ;;   (define-key notmuch-search-mode-map " " spacemacs-cmds)
  ;;   (define-key notmuch-show-mode-map " " spacemacs-cmds))

  (with-eval-after-load 'org

    ;; (require 'ob)
    ;; (require 'ob-shell)
    ;; (require 'ob-ruby)
    ;; (require 'ob-python)
    ;; (require 'ob-sass)
    ;; (require 'ob-tangle)
    ;; (require 'ob-tangle)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . nil)
       ;;(http . t)
       (plantuml . t)
       (python . t)
       (sass . t)
       (shell . t)))

    (setq org-plantuml-jar-path
          (expand-file-name "~/bin/plantuml.jar"))

    (setq org-use-speed-commands t
          org-return-follows-link t
          org-hide-emphasis-markers t
          org-completion-use-ido t
          org-outline-path-complete-in-steps nil
          org-src-fontify-natively t   ;; Pretty code blocks
          org-src-tab-acts-natively t
          org-confirm-babel-evaluate nil
          org-todo-keywords '((sequence "TODO(t)" "DOING(g)" "|" "DONE(d)")
                              (sequence "|" "CANCELED(c)")))
    (add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
    (add-to-list 'auto-mode-alist '(".*/[0-9]*$" . org-mode))   ;; Journal entries

    (setq org-jira-working-dir "~/Dokumente/org/jira")
    (setq org-agenda-files (list "~/Sync/org/gcal.org"
                                 "~/Sync/org/i.org"
                                 "~/Sync/org/schedule.org"
                                 "~/Sync/org/todo.org"
                                 "~/Sync/org/work.org"
                                 "~/Dokumente/org/jira"))

    (defconst org-jira-progress-issue-flow
      '(("Open" . "Assigned")
        ("Assigned" . "In Progress")
        ("In Progress" . "Blocked")
        ("In Progress" . "Closed")))

    (setq org-agenda-custom-commands
          `(("F" "Closed Yesterday"
             tags (concat "+TODO=\"DONE\""
                          "+CLOSED>=\"" (format-time-string "[%Y-%m-%d]" (time-subtract (current-time) (days-to-time 1))) "\""))
            ("3" "Closed 3 days ago"
             tags (concat "+TODO=\"DONE\""
                          "+CLOSED>=\"" (format-time-string "[%Y-%m-%d]" (time-subtract (current-time) (days-to-time 3))) "\""))))

    (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
    (setq org-refile-use-outline-path 'file)
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-allow-creating-parent-nodes 'confirm)


    (setq org-capture-templates
          '(("a" "Appointments" entry (file  "~/Sync/org/gcal.org" )
             "* %^{Subject}\n%^T\n\n%^{Description}\n" :empty-lines-before 1)
            ("l" "Link" entry (file+headline "~/Sync/org/links.org" "Links")
             "* %? %^L %^g \n%T" :prepend t)
            ("b" "Blog idea" entry (file+headline "~/Sync/org/i.org" "Blog Topics:")
             "* %?\n%T" :prepend t)
            ("t" "Personal Task" entry (file+headline "~/Sync/org/todo.org" "To Do")
             "* TODO %?\n%u" :prepend t)
            ("w" "Work Task" entry (file+headline "~/Sync/org/work.org" "To Do")
             "* TODO %?\n%u" :prepend t)
            ("n" "Note" entry (file+headline "~/Sync/org/i.org" "Note space")
             "* %?\n%u" :prepend t)
            ("j" "Journal" entry (file+datetree "~/Sync/org/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")
            ("s" "Screencast" entry (file "~/Sync/org/screencastnotes.org")
             "* %?\n%i\n")))

    (with-eval-after-load 'org-gcal
      (setq org-gcal-client-id (get-authinfo-login "gcal.api" "9999")
	          org-gcal-client-secret (get-authinfo-pass "gcal.api" "9999")
            org-gcal-file-alist '(("mintert@billiger-mietwagen.de" . "~/Sync/org/gcal.org")))
      (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-fetch) ))
      (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) )))

    (with-eval-after-load 'org-brain
      (setq org-brain-path "~/Dropbox/org-brain")
      ;; For Evil users
      (with-eval-after-load 'evil
        (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
      :config
      (setq org-id-track-globally t)
      (setq org-id-locations-file "~/Dropbox/org-brain/.org-id-locations")
      (push '("b" "Brain" plain (function org-brain-goto-end)
              "* %i%?" :empty-lines 1)
            org-capture-templates)
      (setq org-brain-visualize-default-choices 'all)
      (setq org-brain-title-max-length 12))

    (with-eval-after-load 'org-brain
      (use-package org-cliplink :ensure t)
      (defun org-brain-cliplink-resource ()
        "Add a URL from the clipboard as an org-brain resource.
Suggest the URL title as a description for resource."
        (interactive)
        (let ((url (org-cliplink-clipboard-content)))
          (org-brain-add-resource
           url
           (org-cliplink-retrieve-title-synchronously url)
           t)))
      (define-key org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource))
  ))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(create-lockfiles nil)
 '(evil-want-Y-yank-to-eol nil)
 '(gnus-buttonized-mime-types (quote ("mulitpart/encrypted" "multipart/signed")))
 '(mm-decrypt-option (quote always))
 '(mm-verify-option (quote always))
 '(mml-smime-cache-passphrase t)
 '(mml-smime-use (quote epg))
 '(notmuch-saved-searches
   (quote
    ((:name "inbox" :query "tag:Inbox" :key "i" :sort-order newest-first)
     (:name "admin" :query "tag:admin" :key "a" :sort-order newest-first)
     (:name "unread" :query "tag:unread" :key "u" :sort-order newest-first)
     (:name "flagged" :query "tag:flagged" :key "f")
     (:name "sent" :query "tag:sent" :key "t")
     (:name "drafts" :query "tag:draft" :key "d"))))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-latex-compiler "xelatex")
 '(org-latex-listings (quote minted))
 '(org-latex-listings-options (quote (("breaklines" "true"))))
 '(org-latex-minted-options (quote (("breaklines" "true") ("breakanywhere" "true"))))
 '(org-latex-packages-alist (quote (("" "listings" t) ("" "minted" t))))
 '(org-latex-pdf-process
   (quote
    ("%latex -interaction nonstopmode -shell-escape -output-directory %o %f" "%latex -interaction nonstopmode -shell-escape -output-directory %o %f" "%latex -interaction nonstopmode -shell-escape -output-directory %o %f")))
 '(package-selected-packages
   (quote
    (csv-mode vterm ewal-spacemacs-themes spacemacs-theme ewal-evil-cursors ewal vmd-mode jinja2-mode company-ansible ansible-doc ansible terraform-mode hcl-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode org-jira nginx-mode mu4e-maildirs-extension mu4e-alert ht salt-mode mmm-jinja2 ranger yaml-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help dockerfile-mode docker docker-tramp notmuch gnus-alias yasnippet-snippets org-cliplink pdf-tools tablist web-mode web-beautify tagedit slim-mode scss-mode sass-mode restclient-helm pug-mode ob-restclient ob-http livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang helm-css-scss haml-mode go-guru go-eldoc fish-mode emmet-mode company-web web-completion-data company-tern tern company-shell company-restclient restclient know-your-http-well company-go go-mode coffee-mode org-gcal request-deferred deferred yapfify pyvenv pytest pyenv-mode py-isort pony-mode pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic vimrc-mode dactyl-mode org-brain unfill smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy evil-magit magit magit-popup git-commit ghub treepy graphql with-editor diff-hl company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete mmm-mode markdown-toc markdown-mode gh-md ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-github-token t)
 '(send-mail-function (quote sendmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(create-lockfiles nil)
 '(evil-want-Y-yank-to-eol nil)
 '(gnus-buttonized-mime-types (quote ("mulitpart/encrypted" "multipart/signed")))
 '(mm-decrypt-option (quote always))
 '(mm-verify-option (quote always))
 '(mml-smime-cache-passphrase t)
 '(mml-smime-use (quote epg))
 '(notmuch-saved-searches
   (quote
    ((:name "inbox" :query "tag:Inbox" :key "i" :sort-order newest-first)
     (:name "admin" :query "tag:admin" :key "a" :sort-order newest-first)
     (:name "unread" :query "tag:unread" :key "u" :sort-order newest-first)
     (:name "flagged" :query "tag:flagged" :key "f")
     (:name "sent" :query "tag:sent" :key "t")
     (:name "drafts" :query "tag:draft" :key "d"))))
 '(org-agenda-files
   (quote
    ("~/Sync/org/gcal.org" "~/Sync/org/i.org" "~/Sync/org/schedule.org" "~/Sync/org/todo.org" "~/Sync/org/work.org")))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-latex-compiler "xelatex")
 '(org-latex-listings (quote minted))
 '(org-latex-listings-options (quote (("breaklines" "true"))))
 '(org-latex-minted-options (quote (("breaklines" "true") ("breakanywhere" "true"))))
 '(org-latex-packages-alist (quote (("" "listings" t) ("" "minted" t))))
 '(org-latex-pdf-process
   (quote
    ("%latex -interaction nonstopmode -shell-escape -output-directory %o %f" "%latex -interaction nonstopmode -shell-escape -output-directory %o %f" "%latex -interaction nonstopmode -shell-escape -output-directory %o %f")))
 '(package-selected-packages
   (quote
    (csv-mode vterm ewal-spacemacs-themes spacemacs-theme ewal-evil-cursors ewal vmd-mode jinja2-mode company-ansible ansible-doc ansible terraform-mode hcl-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode org-jira nginx-mode mu4e-maildirs-extension mu4e-alert ht salt-mode mmm-jinja2 ranger yaml-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help dockerfile-mode docker docker-tramp notmuch gnus-alias yasnippet-snippets org-cliplink pdf-tools tablist web-mode web-beautify tagedit slim-mode scss-mode sass-mode restclient-helm pug-mode ob-restclient ob-http livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang helm-css-scss haml-mode go-guru go-eldoc fish-mode emmet-mode company-web web-completion-data company-tern tern company-shell company-restclient restclient know-your-http-well company-go go-mode coffee-mode org-gcal request-deferred deferred yapfify pyvenv pytest pyenv-mode py-isort pony-mode pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic vimrc-mode dactyl-mode org-brain unfill smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy evil-magit magit magit-popup git-commit ghub treepy graphql with-editor diff-hl company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete mmm-mode markdown-toc markdown-mode gh-md ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-github-token t)
 '(send-mail-function (quote sendmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
