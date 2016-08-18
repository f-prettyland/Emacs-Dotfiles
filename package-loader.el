; package-loader.el
; package loading system inspired by http://y.tsutsumi.io/emacs-from-scratch-part-2-package-management.html
; which was in turn taken from the emacs prelude
(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    atom-one-dark-theme
    base16-theme
    cider
    clojure-mode
    company
    company-racer
    darkokai-theme
    darktooth-theme
    ess
    evil
    evil-escape
    evil-org
    evil-surround
    exec-path-from-shell
    flycheck
    flycheck-rust
    general
    hl-todo
;;  helm
    intero
    magit
    multiple-cursors
    multi-term
    org-bullets
    projectile
    rainbow-delimiters
    rust-mode
    racer
    swiper
    toml-mode
    which-key
    yasnippet
  ) "a list of packages to ensure are installed at launch.")


; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))


;; ==========================================
;; Manually Installed Packages
;; ==========================================
