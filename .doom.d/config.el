;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq comp-speed 2)

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;;(setq doom-font (font-spec :family "JetBrains Mono" :size 12 :weight 'semi-light))
(setq doom-font (font-spec :family "Fira Code" :size 12))

;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#21242b" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(custom-safe-themes
   (quote
    ("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ff6c6b")
 '(package-selected-packages (quote (exec-path-from-shell evil-multiedit)))
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
 '(rustic-ansi-faces
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; treemacs theme
(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
(doom-themes-treemacs-config)

(add-load-path! "~/.doom.d/additional-packages")

(setq projectile-project-search-path '("~/Documents/code"))

(setq magit-git-executable "/usr/bin/git")

;; (scrolling) performance improvements (see https://github.com/hlissner/doom-emacs/issues/2217 )
(use-package hl-line+
  :load-path "3rd"
  :config
  (hl-line-when-idle-interval 0.3)
  (toggle-hl-line-when-idle 1))

(use-package display-line-numbers
  :ensure nil
  :init
  (setq display-line-numbers-width-start t)
  (global-display-line-numbers-mode))


;; key mappings
(map! :leader
      :desc "Next Window" "ö" #'evil-window-next)

(map! :map cider-mode-map
      "M-r" #'cider-eval-defun-at-point)


(when (eq system-type 'darwin)
  ;; only execute on MacOS

  ;; alt key modifier for square brackets etc
  (setq ns-alternate-modifier 'none)
  (setq ns-right-command-modifier 'meta)

  ;; macOS fullscreen
  (setq ns-use-native-fullscreen t)
  (add-to-list 'default-frame-alist '(fullscreen . fullboth))

  ;; switch theme according to MacOS dark mode settings
  ;;(require 'auto-dark-emacs)

  ;; for emacs-plus only: appearance (dark/ light mode) hooks (don't need auto-dark-emacs)
  (add-hook 'ns-system-appearance-change-functions
          #'(lambda (appearance)
              (mapc #'disable-theme custom-enabled-themes)
              (pcase appearance
                ('light (load-theme 'zaiste t))
                ('dark (load-theme 'doom-one t)))))

  ;; keep $PATH from within the same as from user with exec-path-from-shell package
  (exec-path-from-shell-initialize)
)


;; disable mouse
(require 'disable-mouse)
(global-disable-mouse-mode)

