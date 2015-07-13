(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install them
(ensure-package-installed 'evil
                          'flycheck
                          'iedit
                          'powerline
                          'powerline-evil
                          'restclient
                          'expand-region
                          'markdown-mode
                          'web-mode)

;; evil-mode
(evil-mode t)

;; powerlone-mode
(powerline-default-theme)

;; expand-region
(global-set-key (kbd "M-S-<up>") 'er/expand-region)
(global-set-key (kbd "M-S-<down>") 'er/contract-region)

;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-always-indent t)
(show-paren-mode 1)
(setq whitespace-style (quote (spaces tabs space-mark tab-mark)))
(global-visual-line-mode 1)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(ansi-term-color-vector
   [unspecified "#000000" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#7aa6da" "#eaeaea"] t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" "2d7e4feac4eeef3f0610bf6b155f613f372b056a2caae30a361947eab5074716" "87ffc84ad0d677241db724417b7866fb66cb01bef19256d90f7198befec1fc67" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "75c0b1d2528f1bce72f53344939da57e290aa34bea79f3a1ee19d6808cb55149" "3514fe07ecd0dc2f8b747706370c169b3d8053f825c009414e1a86eac8978327" "3f04f37604c5f5cc3c71bc1a4a604ed8be340d0f150946b25658e403ccbad6d2" "1dd2d01010a9ae1f54775abceb080e231b6f9c781c5282b25b8c4edd3f3a14e0" "1abda075ebacaa3795d675bb2be0a905322ac856f9c0c259da63f9ccfe1962ec" "37783713b151d949b0da66ff7cd8736dd0893089cbad12eb5a71f3a72e201b47" "61724add6ddc09a0426f6b39109a76dd83174cf36d76563d3a35c7e07c0753c6" "e0162042769535430ee3c51f8a775c353b37906fa4ad47d0861d9497b95186dd" "9fab7d4f70b99927d898a0c93b1ae90fc1529248b9c2604ed88e864fc2665aa7" "d7e434a3c19f87fa00b945edfaedc9a21a6e436a7814c23277d4112ad83b5e85" "f0dfe326bdbb237d6bc3f533d371ffa7c894a12bb0a5bcd4cb67a948a4a13101" "8a36587d6cbcc30c85372568ed29d45ec393a32e3c779cba8cfd5fade229025d" "9c22be8846bce5d64c803b1f7f4051f0675ba7c0eb492e03a17bb765b0a35d82" "01d8c9140c20e459dcc18addb6faebd7803f7d6c46d626c7966d3f18284c4502" "d3a86848a5e9bf123f3dd3bf82ab96995837b50f780dd7d5f65dc72c2b81a955" "6dbd0dd4c344f1ca534422cc5a1fd3ed822dcde947ae983948b70c7284a0ed33" "13f85dabe9c9abd73426f190aeedb7d0ad32d29e1fef3138ec8a2435a8fb0910" "3539b3cc5cbba41609117830a79f71309a89782f23c740d4a5b569935f9b7726" "7545d3bb77926908aadbd525dcb70256558ba05d7c478db6386bfb37fb6c9120" "9f3a4edb56d094366afed2a9ba3311bbced0f32ca44a47a765d8ef4ce5b8e4ea" "ced74ff794aad9ac93266bf9a9a92c5641c01b05715c6862e30459a24844eec9" "fe6fb0cb1aa50dc563d81aad98c470a30f4e89db6d55a108f1083f33317ad413" "27890155f81d23512a9933f4ac6110e94de6266e948fd464eda3423c799713e2" "83279c1d867646c5eea8a804a67a23e581b9b3b67f007e7831279ed3a4de9466" "73ae6088787f6f72ef52f19698b25bc6f0edf47b9e677bf0a85e3a1e8a7a3b17" "a88946e2135d3635daf6789c475c7f093e4471ded5391253d6f88bd5271ee4be" "f0e69da2cf73c7f153fc09ed3e0ba6e1fd670fec09b8a6a8ed7b4f9efea3b501" "06538a1193c63f02cd0c7caee54105fa204e24a137ab9b56f86fdd8df6e5ddd4" "17fd8388e49d3055185e817ed3a2b7c955a2dda92b990f475c14a8e1d97dbe4b" "0340c9738ef19a54c47ad47c301786c80851d4ab50876c4e341e33141b0e37a6" "3f7db1a70bee5e15a3d72b016a7e05f6d813b6868e88961c46019b57d0b29452" "234976f82b2d64c6d2da3bca061d9f09b46e1496f02451fe02a4c707fab32321" "5d139820639cd941c60033dcdd462bf5fffa76da549e6bdf1d83945803d30f01" "500e239194d4362a579ba5ef4d552aa45304db855572984af447dff261b04c35" "6184465774e662dc5f3ddb0751b20d97aaff2ae95d5cf3c885b6c1944ddcb371" "86847534b000a2e7f2b77c24faf3a94283329073bd4687807a4b6a52cae752dd" "54a8c782a7a66e9aeb542af758f7f9f1a5702b956f425ffe15fccf5339f01f1e" "0646e3c982ea2169704bb8fe12cb372cf4711156b3b69967353ed7d40a1044b9" "cc495c40747ae22dd2de6e250cbd9a408e3588b59989368af565deeeff334126" "4ab89cc4c58408bb799084a4d9be77fe0700b2f1b75809eae330129b4b921b6f" "d72836155cd3b3e52fd86a9164120d597cbe12a67609ab90effa54710b2ac53b" "307e7ade9a12d6c91fc0871c28708f49f1558aac8ba8639e43cfc03e80b44079" "17f35b689dd41e49cb740bfb810ac8a53d13292cbebf68f41f772787d8b3aebf" "ff5acbbf20c7ba4889eb2b14395fcd55eeecbfb57853e47c7d514503ad83d6bb" "e7ec0cc3ce134cc0bd420b98573bbd339a908ac24162b8034c98e1ba5ee1f9f6" "0240d45644b370b0518e8407f5990a243c769fb0150a7e74297e6f7052a04a72" "30611406f83fae3d001e917b03ad47bbd1c7797cf640a2e7db9d2445741e2554" "4cc014287035b11d1f8d45af1ff18f3509496a760650d16c7771ac9bdf16b1a6" "b953823053c6372fafde04957ab6d482021cc3a0f4b279f2868180c3ca56ca59" "6ebb2401451dc6d01cd761eef8fe24812a57793c5ccc427b600893fa1d767b1d" "cda6cb17953b3780294fa6688b3fe0d3d12c1ef019456333e3d5af01d4d6c054" "c16710544cb65de411e270a6191c1223996200cb178456d544e6ddb5555462a2" "67b6ff0b4786c485ea606167da3b963a35ba37406017c4f50754dcd16230b75b" "4cdea318a3efab7ff7c832daea05f6b2d5d0a18b9bfa79763b674e860ecbc6da" "3328e7238e0f6d0a5e1793539dfe55c2685f24b6cdff099c9a0c185b71fbfff9" "65389b3bf300a127c81a8902cb155ee64b3974dbfbb80ffae3dba337a5acdbf7" "113ae6902d98261317b5507e55ac6e7758af81fc4660c34130490252640224a2" "4870e6cb6f0a70c14ee73db30b69a8a1f08d6ec9a689c366e88636fb81e8022d" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(fci-rule-color "#49483E")
 '(frame-background-mode (quote dark))
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(inhibit-startup-screen t)
 '(linum-format (quote dynamic))
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(ps-use-face-background nil)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
