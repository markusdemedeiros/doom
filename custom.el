(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ignored-local-variable-values '((TeX-command-extra-options . "-shell-escape")))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(package-selected-packages '(math-symbol-lists)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(proof-error-face ((t (:background "dark red"))))
 '(proof-locked-face ((t (:extend t :background "gray0")))))
(put 'company-coq-fold 'disabled nil)

(getenv "PATH")
 (setenv "PATH"
   (concat "/opt/local/bin/pdflatex"
           ":"
           (getenv "PATH")))

(setq doc-view-resolution 400)
