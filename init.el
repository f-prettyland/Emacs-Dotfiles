(load "~/.emacs.d/package-config.el")

(setq backup-directory-alist
      `((".*" . "~/.saves")))
(setq auto-save-file-name-transforms
      `((".*" "~/.saves" t)))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "PYTHONPATH")
(exec-path-from-shell-copy-env "PASSFORT_ROOT")
(exec-path-from-shell-copy-env "PASSFORT_CONFIG")
(exec-path-from-shell-copy-env "WORKON_HOME")
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-base16-solarized-dark)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "0b83fa904446177e433ff3061c65375e1e5f6fa36d169b5adcba46197b74fad0" "4f0f2f5ec60a4c6881ba36ffbfef31b2eea1c63aad9fe3a4a0e89452346de278" "e8a976fbc7710b60b069f27f5b2f1e216ec8d228fe5091f677717d6375d2669f" "a164837cd2821475e1099911f356ed0d7bd730f13fa36907895f96a719e5ac3e" "b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9567c8b113a53efdf4e7f3ab47564cb44b27ee231ece20811bb191698b1b8b6b" "91fba9a99f7b64390e1f56319c3dbbaed22de1b9676b3c73d935bf62277b799c" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "06fc6014871028d24b4e03db24b9efee48bd73dce0afdc15e9124f09fab64afa" "1edf370d2840c0bf4c031a044f3f500731b41a3fd96b02e4c257522c7457882e" "cb18233197cedab557c70d171b511bed49cc702f428750925280090c31498bd2" "294834baa9ca874795a3181cce7aaf228b1e3fb3899587ffd3ae7546de328c90" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "b2028956188cf668e27a130c027e7f240c24c705c1517108b98a9645644711d9" "8ffaf449297bd9a08517f4b03a4df9dbf3e347652746cefceb3ee57c8e584b9f" "90b1aeef48eb5498b58f7085a54b5d2c9efef2bb98d71d85e77427ce37aec223" "3fb38c0c32f0b8ea93170be4d33631c607c60c709a546cb6199659e6308aedf7" "db9feb330fd7cb170b01b8c3c6ecdc5179fc321f1a4824da6c53609b033b2810" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" "aa87469691932ff791f966bffb885ecd97ebfa4dc4d42e479f3819ac4a3fbcaf" "8e3f020f1ce69cfa0c1ebee4e198feb28dd7eb31b7d77927e9c790819210c654" "76bd62f6ce376bf0597fab7f478eaa98cd94a7b41f0ae46de63a958fbe99c1d9" "e033c4abd259afac2475abd9545f2099a567eb0e5ec4d1ed13567a77c1919f8f" "59ca830d4df5e79503b79103485d28c6a578ca14d526ffc6a43596808daf1282" "e2e4e109357cfcebccb17961950da6b84f72187ade0920a4494013489df648fe" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "d43120398682953ef18fd7e11e69c94e44d39bb2ab450c4e64815311542acbff" "1462969067f2ff901993b313085d47e16badeec58b63b9ed67fa660cebaaddae" "0f98f9c2f1241c3b6227af48dc96e708ec023dd68363edb5d36dc7beaad64c23" "bf81a86f9cfa079a7bb9841bc6ecf9a2e8999b85e4ae1a4d0138975921315713" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" "c70cc9c4c6257d70f5c11b90cb9e8b1e54e6edd6aa43f39879746e16a70533f5" "0bd7a42bd443517e5e61dac3cabc24018fbd0c6b2b4199b3c4efd9e3727efd30" "232f715279fc131ed4facf6a517b84d23dca145fcc0e09c5e0f90eb534e1680f" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "f21caace402180ab3dc5157d2bb843c4daafbe64aadc362c9f4558ac17ce43a2" "aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" default)))
 '(electric-pair-mode t)
 '(erc-fill-mode t)
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin/" "/Users/jac32/.cargo/bin")))
 '(flycheck-rust-executable nil)
 '(global-visual-line-mode t)
 '(js2-missing-semi-one-line-override nil)
 '(js2-strict-missing-semi-warning nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(load "~/.emacs.d/visual-config.el")

(setq initial-major-mode 'org-mode)
(put 'narrow-to-region 'disabled nil)
