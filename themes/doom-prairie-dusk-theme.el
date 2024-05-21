;;; doom-prairie-dusk-theme.el --- a theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: July 15, 2019 (#303)
;; Author: ema2159 <https://github.com/ema2159>
;; Maintainer:
;; Source: https://github.com/bbatsov/solarized-emacs
;; Source: https://ethanschoonover.com/solarized
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-prarie-dusk-theme nil
  "Options for the `doom-prairie-dusk' theme."
  :group 'doom-themes)

(defcustom doom-prairie-dusk-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-prairie-dusk-theme
  :type 'boolean)

(defcustom doom-prairie-dusk-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-prairie-dusk-theme
  :type 'boolean)

(defcustom doom-prairie-dusk-brighter-text nil
  "If non-nil, default text will be brighter."
  :group 'doom-prairie-dusk-theme
  :type 'boolean)

(defcustom doom-prairie-dusk-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-prairie-dusk-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-prairie-dusk
  "A dark theme inspired by VS Code Solarized Dark"

  ;; name        default   256       16
  ((bg         '("#1E1E1D" "#1E1E1D" "brightwhite"))
   (fg         '("#CECECE" "#CECECE" "brightwhite"))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#1E1E1D" "#1E1E1D" "white"       ))
   (fg-alt     '("#CECECE" "#CECECE" "white"       ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#040404" "#040404" "black"       ))
   (base1      '("#1E1E1D" "#1E1E1D" "brightblack" ))
   (base2      '("#1F1F1F" "#1F1F1F" "brightblack" ))
   (base3      '("#323232" "#323232" "brightblack" ))
   (base4      '("#5b5b5b" "#5b5b5b" "brightblack" ))
   (base5      '("#878787" "#878787" "brightblack" ))
   (base6      '("#B7B7B7" "#B7B7B7" "brightblack" ))
   (base7      '("#CECECE" "#CECECE" "brightblack" ))
   (base8      '("#DDDDDD" "#DDDDDD" "white"       ))

   (grey       base4)
   (red        '("#a54242" "#a54242" "red"          ))
   (orange     '("#de935f" "#de935f" "brightred"    ))
   (green      '("#8c9440" "#8c9440" "green"        ))
   (teal       '("#b5bd68" "#b5bd68" "brightgreen"  ))
   (yellow     '("#f0c674" "#f0c674" "yellow"       ))
   (blue       '("#81a2be" "#81a2be" "brightblue"   ))
   (dark-blue  '("#5f819d" "#5f819d" "blue"         ))
   (magenta    '("#85678f" "#85678f" "magenta"      ))
   (violet     '("#b294bb" "#b294bb" "brightmagenta"))
   (cyan       '("#5e8d87" "#5e8d87" "brightcyan"   ))
   (dark-cyan  '("#8abeb7" "#8abeb7" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.5))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-prairie-dusk-brighter-comments blue base5))
   (doc-comments   teal)
   (constants      magenta)
   (functions      blue)
   (keywords       green)
   (methods        cyan)
   (operators      orange)
   (type           yellow)
   (strings        cyan)
   (variables      violet)
   (numbers        magenta)
   (region         base0)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (-modeline-bright doom-prairie-dusk-brighter-modeline)
   (-modeline-pad
    (when doom-prairie-dusk-padded-modeline
      (if (integerp doom-prairie-dusk-padded-modeline) doom-prairie-dusk-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base3
      `(,(doom-darken (car bg) 0.1) ,@(cdr base0))))
   (modeline-bg-alt
    (if -modeline-bright
        base3
      `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt (doom-darken bg 0.1)))


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if doom-prairie-dusk-brighter-comments (doom-lighten bg 0.05)))
   ((font-lock-keyword-face &override) :weight 'bold)
   ((font-lock-constant-face &override) :weight 'bold)
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))

   ;;;; coq
   (proof-queue-face :background "#1F1F1F")

   ;;;; centaur-tabs
   (centaur-tabs-active-bar-face :background blue)
   (centaur-tabs-modified-marker-selected
    :inherit 'centaur-tabs-selected :foreground blue)
   (centaur-tabs-modified-marker-unselected
    :inherit 'centaur-tabs-unselected :foreground blue)
   ;;;; company
   (company-tooltip-selection     :background dark-cyan)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background blue)
   (doom-modeline-evil-emacs-state  :foreground magenta)
   (doom-modeline-evil-insert-state :foreground blue)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; helm
   (helm-selection :inherit 'bold
                   :background selection
                   :distant-foreground bg
                   :extend t)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-url-face    :foreground teal :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground green)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground (doom-darken blue 0.2))
   ((outline-5 &override) :foreground (doom-darken green 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken blue 0.4))
   ((outline-8 &override) :foreground (doom-darken green 0.4))
   ;;;; org <built-in>
   ((org-block &override) :background base0)
   ((org-block-begin-line &override) :foreground comments :background base0)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;;;; Base theme variable overrides-
  ;; ()
  )

;;; doom-prairie-dusk-theme.el ends here
