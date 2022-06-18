;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Daniel Kim"
      user-mail-address "coconutstudio@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Fantasque Sans Mono" :size 16)
	doom-variable-pitch-font (font-spec :family "Arial" :size 32)
)

;; from DistroTube
;; (setq doom-font (font-spec :family "Source Code Pro" :size 15)
;;       doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
;;       doom-big-font (font-spec :family "Source Code Pro" :size 24))
;; enable italic
;; (after! doom-themes
;;   (setq doom-themes-enable-bold t
;;         doom-themes-enable-italic t))
;; (custom-set-faces!
;;   '(font-lock-comment-face :slant italic)
;;   '(font-lock-keyword-face :slant italic))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'wombat)
(setq doom-theme 'deeper-blue)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; allow mouse in terminal (xterm)
(xterm-mouse-mode 1)

;; if file is updated outside of emacs, this will update the buffer to change
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; from Distrotube
;; This setting ensures that emacsclient always opens on dashboard rather than scratch.
(setq doom-fallback-buffer-name "*dashboard*")


;; turn off whitespace mode, otherwise, it will highlight all whitespace (not verified)
(setq global-whitespace-mode nil)
;; (setq whitespace-mode nil)
;;
;; free of trailing whitespace and to use 80-column width, standard indentation
;;(setq whitespace-style nil)
;;(setq whitespace-style '(trailing lines space-before-tab
;;                                  indentation space-after-tab)
;;)
(setq whitespace-style '(lines-tail tab-mark))
(setq whitespace-line-column 80)
(whitespace-mode nil)
;; highlight 80th column
    ;;(setq test)

;; `test'  abcdefg hhh abcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg habcdefg h
;; `test'  abcdefg hhh abcdefg habcdefg habcdefg habcdefg habcdefg habcd abc abc abc abc abdef afgdf
	                                           ;;abc
	                                           ;;abc
						   ;;
;;(setq-default tab-width imenu)

;; imenu-list
;; 4-list (markdown, etc)
(imenu-list-minor-mode)
(after! imenu-list (map! :niv "C-'" #'imenu-list-smart-toggle))

;;===========================================================================
;;; keyboard mapping
(map! :niv "C-j" #'evil-scroll-down)
(map! :niv "C-k" #'evil-scroll-up)

(map! :niv "C-SPC" #'evil-window-next)

;; go to next buffer Cmd+shift+], Cmd+shift+[, emulate tab
; (map! :niv "s-}" #'switch-to-next-buffer)
; (map! :niv "s-{" #'switch-to-prev-buffer)

;; tabs
(map! :niv "M-}" #'tab-next)
(map! :niv "M-{" #'tab-previous)
;(map! :niv "C-t" #'tab-new)
(map! :niv "C-t" #'find-file-other-tab)
(map! :niv "M-w" #'tab-close)

;; indent
(map! :i "C-." #'evil-shift-right)
;; C-, doesn't work for shift-left!, need something else...
(map! :i "C-," #'evil-shift-left)


;;===========================================================================
;;; surround
;; \\ => surround with `backtick` for markdown codes
(map! :n "\\\\" "ysiW`")
(map! :i "\\\\" "<ESC>ysiW`Ea")
(map! :leader  "\\" "^ys$`")

;; (map! :i "\\\\" ("abc" "def"))
;; (map! :leader
;;       :desc "New journal entry"
;;       "a j j" #'org-journal-new-entry)
;; nmap <Leader>\ ^ys$`
; nmap \\  ysiW`
; vmap \\ S`
; (map! :i "\\\\" (an)"bbb")idef qqqdef  def qqq def


;; persp.el instead of tab
;(map! :niv "M-}" #'+workspace/switch-right)
;(map! :niv "M-{" #'+workspace/switch-left)

; disable annoying exit prompt
(setq confirm-kill-emacs nil)

;; word-wrapping off
;; general text
(setq-default truncate-lines t)
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle truncate lines" "t" #'toggle-truncate-lines))

;; for markdown-mode
(add-hook 'markdown-mode-hook (lambda () (setq truncate-lines t)))


;;===========================================================================
;;;markdown-mode
;;
;; show nested instead of flat tree in imenu
;;(setq markdown-nested-imenu-heading-index t)
;;(add-hook 'markdown-mode-hook 'visual-line-mode)
;;(add-hook 'prog-mode-hook 'enable-tabs)

;; (add-hook 'lisp-mode-hook 'disable-tabs)
;; (add-hook 'emacs-lisp-mode-hook 'disabl;e-tabs)(add-hook 'markdown-mode-hook 'as/markdown-config)

;; from DistroTube
(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.8))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.2)))))



;;(global-visual-line-mode t)

;; use tab instead of space
(setq-default indent-tabs-mode t)


;; ============ Use UTF-8 LF (not CRLF) =================
;; affects any new file. This was problematic in Windows as it was creating CRLF text
(setq-default buffer-file-coding-system 'utf-8-unix)

;;===========================================================================
;;;Platform specific
(cond ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here.
       ;; window uses UTF16,... paste is incorrect
	(set-clipboard-coding-system 'utf-16le-dos)
       )
      ((eq system-type 'darwin)
       ;; Mac-specific code goes here.
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here.
       ))


;; ======= delete all blank lines in region ============================
; " highlighted text - remove all empty lines
; from [Removing blank lines in a buffer - Mastering Emacs](https://www.masteringemacs.org/article/removing-blank-lines-buffer)
(defun flush-blank-lines (start end) (interactive "r") (flush-lines "^\\s-*$" start end nil))
(map! :leader "d" #'flush-blank-lines)

;;===========================================================================
;;;Clippy
;; from DistroTube
(map! :leader
      (:prefix ("c h" . "Help info from Clippy")
       :desc "Clippy describes function under point" "f" #'clippy-describe-function
       :desc "Clippy describes variable under point" "v" #'clippy-describe-variable))

;; (after! org-superstar-mode
;; 	(org-superstar-configure-like-org-bullets))

;;===========================================================================
;;; org mode
;; from DistroTube
;;===========================================================================
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.4 :weight bold :family "variable-pitch"))))
  ;'(org-level-1 ((t (:inherit outline-1 :height 1.4))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)



;; show menu-bar
(menu-bar-mode 1)

;;===========================================================================
