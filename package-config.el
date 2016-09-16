; package-config.el
; package loading system inspired by http://y.tsutsumi.io/emacs-from-scratch-part-2-package-management.html
; which was in turn taken from the emacs prelude

; load packages
(load "~/.emacs.d/package-loader.el")

(require 'evil)
(require 'evil-org)
(require 'evil-surround)
(require 'company)
(require 'flycheck)
(require 'general)
;;(require 'helm)
(require 'magit)
(require 'multi-term)
(require 'projectile)
(require 'rust-mode)
(require 'racer)
(require 'rainbow-delimiters)
(require 'swiper)
(require 'company-racer)
(require 'yasnippet)


;; =============================================================================
;; Exec Path From Shell
;; =============================================================================
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; =============================================================================
;; Company Mode - Global Config
;; =============================================================================
(global-company-mode)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(add-hook 'eshell-mode-hook (lambda()
    (company-mode -1)))
(add-hook 'shell-mode-hook (lambda()
    (company-mode -1)))



;; =============================================================================
;; Evil Mode
;; =============================================================================
(evil-mode 1)


;; Evil Escape - Alternative Escape Sequence
;; ------------------------------------------

;; (evil-escape-mode)
;; (setq-default evil-escape-delay 0.2)
;; (setq-default evil-escape-key-sequence "jk")

;; General - Multiple Leader Keys
;; -------------------------------

(general-evil-setup t)
(nvmap :prefix ","
       "b" 'back-to-previous-buffer
       "w" 'save-buffer
       "g" 'magit-status
       "c" 'comment-or-uncomment-region)

(nvmap :prefix "SPC"
       "h" 'windmove-left
       "j" 'windmove-down
       "k" 'windmove-up
       "l" 'windmove-right
       "H" 'shrink-window-horizontally
       "J" 'shrink-window
       "K" 'enlarge-window
       "L" 'enlarge-window-horizontally
       "t" 'multi-term-dedicated-toggle
       "ff" 'toggle-frame-fullscreen)


;; Evil Surround - Add the "surroundings" context
;; ------------------------------------------------
(global-evil-surround-mode 1)


;; =============================================================================
;; Flycheck Mode
;; =============================================================================
(global-flycheck-mode)

(general-define-key :states '(normal motion insert emacs)
                    :keymaps 'flycheck-mode-map
                    :prefix ","
                    :non-normal-prefix "M-,"
		    "en" 'flycheck-next-error
		    "el" 'flycheck-list-errors
		    "er" 'flycheck-buffer)

;; =============================================================================
;; Helm
;; =============================================================================
;;(global-set-key (kbd "M-x") 'helm-M-x)
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; =============================================================================
;; HL-TODO - Highlight TODO and similar keywords
;; =============================================================================
(global-hl-todo-mode 1)

;; =============================================================================
;; Swiper/Ivy
;; =============================================================================
(ivy-mode 1)
(global-set-key "\C-s" 'swiper)

;; =============================================================================
;; Magit
;; =============================================================================
(define-key global-map (kbd "C-c m") 'magit-status)

;; =============================================================================
;; Multi-Term
;; =============================================================================
(setq multi-term-dedicated-select t)

;; =============================================================================
;; Org-Bullets
;; =============================================================================
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; =============================================================================
;; Projectile
;; =============================================================================
(projectile-global-mode 1)
(add-to-list 'projectile-globally-ignored-directories "/Users/jac32/")

;; =============================================================================
;; Rainbow Delimiters
;; =============================================================================
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;; =============================================================================
;; YASnippet
;; =============================================================================
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(add-hook 'term-mode-hook (lambda()
    (setq yas-dont-activate-functions t)))

;; =============================================================================
;; Lang - Clojure
;; =============================================================================


;; =============================================================================
;; Lang - Haskell
;; =============================================================================
(add-hook 'haskell-mode-hook 'intero-mode)

;; =============================================================================
;; Lang - Rust
;; =============================================================================
(setq exec-path (append exec-path '("/Users/jac32/.cargo/bin")))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Set path to racer binary
(setq racer-cmd "/usr/local/bin/racer")

;; Set path to rust src directory
(setq racer-rust-src-path "/Users/jac32/.rust/src/")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
 (add-hook 'rust-mode-hook
           (lambda ()
	     (setq flycheck-mode-hook #'flycheck-rust-setup)))

(general-define-key :states '(normal motion insert emacs)
                    :keymaps 'rust-mode-map
                    :prefix ","
                    :non-normal-prefix "M-,"
                    "cr" 'cargo-process-run
		    "ct" 'cargo-process-test
		    "cc" 'cargo-process-build)


;; =============================================================================
;; Web Development
;; =============================================================================
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
