;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

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
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(load-theme 'doom-prairie-dusk t)
;; (setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "Iosevka"))
(setq doom-symbol-font (font-spec :name "Symbola"))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Input of unicode symbols
(require 'math-symbol-lists)
; Automatically use math input method for Coq files
(add-hook 'coq-mode-hook (lambda () (set-input-method "math")))
; Input method for the minibuffer
(defun my-inherit-input-method ()
  "Inherit input method from `minibuffer-selected-window'."
  (let* ((win (minibuffer-selected-window))
         (buf (and win (window-buffer win))))
    (when buf
      (activate-input-method (buffer-local-value 'current-input-method buf)))))
(add-hook 'minibuffer-setup-hook #'my-inherit-input-method)
; Define the actual input method
(quail-define-package "math" "UTF-8" "Ω" t)
(quail-define-rules ; add whatever extra rules you want to define here...
 ("\\fun"    ?λ)
 ("\\mult"   ?⋅)
 ("\\ent"    ?⊢)
 ("\\valid"  ?✓)
 ("\\diamond" ?◇)
 ("\\box"    ?□)
 ("\\bbox"   ?■)
 ("\\later"  ?▷)
 ("\\pred"   ?φ)
 ("\\and"    ?∧)
 ("\\or"     ?∨)
 ("\\comp"   ?∘)
 ("\\ccomp"  ?◎)
 ("\\all"    ?∀)
 ("\\ex"     ?∃)
 ("\\to"     ?→)
 ("\\sep"    ?∗)
 ("\\lc"     ?⌜)
 ("\\rc"     ?⌝)
 ("\\Lc"     ?⎡)
 ("\\Rc"     ?⎤)
 ("\\lam"    ?λ)
 ("\\empty"  ?∅)
 ("\\Lam"    ?Λ)
 ("\\Sig"    ?Σ)
 ("\\-"      ?∖)
 ("\\aa"     ?●)
 ("\\af"     ?◯)
 ("\\auth"   ?●)
 ("\\frag"   ?◯)
 ("\\iff"    ?↔)
 ("\\gname"  ?γ)
 ("\\incl"   ?≼)
 ("\\latert" ?▶)
 ("\\update" ?⇝)

 ;; accents (for iLöb)
 ("\\\"o" ?ö)

 ;; subscripts and superscripts
 ("^^+" ?⁺) ("__+" ?₊) ("^^-" ?⁻)
 ("__0" ?₀) ("__1" ?₁) ("__2" ?₂) ("__3" ?₃) ("__4" ?₄)
 ("__5" ?₅) ("__6" ?₆) ("__7" ?₇) ("__8" ?₈) ("__9" ?₉)

 ("__a" ?ₐ) ("__e" ?ₑ) ("__h" ?ₕ) ("__i" ?ᵢ) ("__k" ?ₖ)
 ("__l" ?ₗ) ("__m" ?ₘ) ("__n" ?ₙ) ("__o" ?ₒ) ("__p" ?ₚ)
 ("__r" ?ᵣ) ("__s" ?ₛ) ("__t" ?ₜ) ("__u" ?ᵤ) ("__v" ?ᵥ) ("__x" ?ₓ)
)
(mapc (lambda (x)
        (if (cddr x)
            (quail-defrule (cadr x) (car (cddr x)))))
      (append math-symbol-list-basic math-symbol-list-extended))






;; Fonts
; (set-face-attribute 'default nil :height 110) ; height is in 1/10pt
; (dolist (ft (fontset-list))
;   ; Main font
;   (set-fontset-font ft 'unicode (font-spec :name "Monospace"))
;   ; Fallback font
;   ; Appending to the 'unicode list makes emacs unbearably slow.
;   ;(set-fontset-font ft 'unicode (font-spec :name "DejaVu Sans Mono") nil 'append)
;   (set-fontset-font ft nil (font-spec :name "DejaVu Sans Mono"))
; )
; ; Fallback-fallback font
; ; If we 'append this to all fontsets, it picks Symbola even for some cases where DejaVu could
; ; be used. Adding it only to the "t" table makes it Do The Right Thing (TM).
; (set-fontset-font t nil (font-spec :name "Symbola"))


(setq coq-smie-user-tokens
   '(("," . ":=")
	("∗" . "->")
	("-∗" . "->")
	("∗-∗" . "->")
	("==∗" . "->")
	("=∗" . "->") 			;; Hack to match ={E1,E2}=∗
	("|==>" . ":=")
	("⊢" . "->")
	("⊣⊢" . "->")
	("↔" . "->")
	("←" . "<-")
	("→" . "->")
	("=" . "->")
	("==" . "->")
	("/\\" . "->")
	("⋅" . "->")
	(":>" . ":=")
	("by" . "now")
	("forall" . "now")              ;; NB: this breaks current ∀ indentation.
   ))



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

(setq proof-three-window-mode-policy 'hybrid)
(setq doc-view-continuous t)
(setf dired-kill-when-opening-new-dired-buffer t)

; (setq twelf-root "/Applications/Twelf/")
; (load (concat twelf-root "emacs/twelf-init.el"))
