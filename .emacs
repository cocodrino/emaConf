(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(cursor-color "#839496")
 '(custom-enabled-themes (quote (darktooth)))
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "4ab5c6fb8ca91cd79bb12bb79a5614fa4b00d1261c139859045a9c37374c51be" "76ed87b94879300b2cb1b3ecb446b19c479c7874022b8db702c722072664c74e" "790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "6a7686db843029a1ca8beec8aadbf094dac5ae592198bd124262fdfeac851d2a" "4cdbdc86cbd7c73c0896364432aed41c9a37078c33b58f2ca49f21eaf77a36af" "47ac4658d9e085ace37e7d967ea1c7d5f3dfeb2f720e5dec420034118ba84e17" default)))
 '(fci-rule-color "#232A2F")
 '(foreground-color "#839496")
 '(markdown-command "rdiscount")
 '(markdown-command-needs-filename nil)
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(projectile-indexing-method (quote alien))
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B3B40")
 '(vc-annotate-color-map (quote ((20 . "#74CBC4") (40 . "#74CBC4") (60 . "#C2E982") (80 . "#FFC400") (100 . "#C792EA") (120 . "#C792EA") (140 . "#546D7A") (160 . "#546D7A") (180 . "#FF516D") (200 . "#9FC59F") (220 . "#859900") (240 . "#F77669") (260 . "#FF516D") (280 . "#82B1FF") (300 . "#82B1FF") (320 . "#82B1FF") (340 . "#D9F5DD") (360 . "#FFCB6B"))))
 '(vc-annotate-very-old-color "#FFCB6B"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 82 :width normal)))))


(require 'package)

(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Initialize all the ELPA packages (what is installed using the packages commands)
(package-initialize)

(setq-default column-number-mode t)

(tool-bar-mode -1)
(setq projectile-indexing-method 'alien)
;;(require 'indent-guide)
;;(indent-guide-global-mode)
; General Auto-Complete
; (require 'auto-complete-config)
; (setq ac-delay 0.0)
; (setq ac-quick-help-delay 0.5)
; (ac-config-default)

;; ac-nrepl (Auto-complete for the nREPL)
(require 'ac-nrepl)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-to-list 'ac-modes 'cider-mode)
(add-to-list 'ac-modes 'cider-repl-mode)


;; Poping-up contextual documentation
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;;(global-rainbow-delimiters-mode)
;;(setq auto-mode-alist (cons '(".*\.sc" . scala-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.sc\\'" . scala-mode))

(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "e" 'find-file)

(evil-leader/set-key "psp" 'projectile-switch-project)
(evil-leader/set-key "pfd" 'projectile-find-file-in-known-projects)
(evil-leader/set-key "pff" 'projectile-find-file)

(evil-leader/set-key "v" 'insert-register)
(evil-leader/set-key "c" 'copy-to-register)
(evil-leader/set-key "aj" 'ace-jump-word-mode)

(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)
(require 'evil-visualstar)


;;(load-theme 'solarized-dark)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map  "kl" 'evil-visual-state)
(key-chord-define evil-normal-state-map  "kl" 'evil-visual-state)
(key-chord-define evil-normal-state-map  "jk" 'evil-insert-state)
(key-chord-define evil-normal-state-map  ";;" 'execute-extended-command)
(key-chord-define evil-normal-state-map  "bj" 'previous-buffer)
(key-chord-define evil-normal-state-map  "bk" 'next-buffer)


(evil-leader/set-key "w w" 'other-window)
(evil-leader/set-key "w s" 'split-window-below)
(evil-leader/set-key "w x" 'delete-window)
(evil-leader/set-key "w k" 'delete-window)
(evil-leader/set-key "w v" 'split-window-right)
(evil-leader/set-key "k" 'previous-multiframe-window)
( evil-leader/set-key "b" 'buffer-menu)

(define-key evil-normal-state-map "0" 'end-of-line)
(define-key evil-visual-state-map "0" 'end-of-line)
(define-key evil-visual-state-map "`" 'beginning-of-line)
(define-key evil-normal-state-map "`" 'beginning-of-line)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq indent-guide-recursive t)


(key-chord-define evil-normal-state-map  ";;"
                  (lambda ()
                    (interactive)
                    (or (boundp 'smex-cache)
                        (smex-initialize))
                    (global-set-key [(meta x)] 'smex)
                    (smex)))



(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))



;;(defun evilnc-default-hotkeys ()
;;  "Set the hotkeys of evil-nerd-comment"
;;  (interactive)
;;  (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
;;  (global-set-key (kbd "C-c l") 'evilnc-comment-or-uncomment-to-the-line)
;;  (global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
;;  (global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)
;;  (eval-after-load 'evil
;;       (define-key evil-normal-state-map ",ci" 'evilnc-comment-or-uncomment-lines)
;;       (define-key evil-normal-state-map ",cl" 'evilnc-comment-or-uncomment-to-the-line)
;;       (define-key evil-normal-state-map ",cc" 'evilnc-copy-and-comment-lines)
;;       (define-key evil-normal-state-map ",cp" 'evilnc-comment-or-uncomment-paragraphs)
;;       (define-key evil-normal-state-map ",cr" 'comment-or-uncomment-region)
;;       ))
;;

(mapc
  (lambda (face)
    (set-face-attribute face nil :weight 'bold :underline nil))
  (face-list))
;; (helm :sources '(helm-source-findutils
;;                  helm-source-recentf
;;                  helm-source-bookmarks
;;                  helm-source-buffers-list
;;                  helm-source-google-suggest
;;                  helm-source-locate
;;                  helm-source-ls-git)
;;       :buffer "*helm all the things*")


(add-to-list 'exec-path "/usr/local/bin")
(global-set-key [f9] 'cider-jack-in)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
;;(require 'json-pretty-print)
(add-to-list 'load-path "/home/yo/.emacs.d")
    (require 'ace-jump-mode)
    (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

; (require 'auto-complete-config)
; (ac-config-default)

(require 'ac-nrepl)

(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-to-list 'ac-modes 'cider-repl-mode)
(add-to-list 'ac-modes 'cider-mode)

(projectile-global-mode)
(setq projectile-indexing-method 'native)

(global-linum-mode t)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq projectile-enable-caching t)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)


(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


;; setup files ending in “.js” to open in js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


(define-key evil-insert-state-map (kbd ";") 'insert-or-append)
(defun insert-or-append ()
  "si el usuario presiona enter saltar al final de la linea y agregar semicolon"
(interactive)
(let ((char-read (read-char-exclusive))
      (trigger ";"))
  (if (eq ?\r char-read)
      (progn
	(end-of-line)
	(insert trigger))
    (insert (this-command-keys)))))



(add-hook 'js2-mode-hook 'skewer-mode)
(evil-leader/set-key  "see" 'skewer-eval-last-expression)
(evil-leader/set-key "sed" 'skewer-eval-defun)
(evil-leader/set-key "slf" 'skewer-load-buffer)
(evil-leader/set-key  "ssr" 'skewer-repl)
(evil-leader/set-key "ssb" 'save-buffer)
;;(global-set-key (kbd "C-s C-s") 'save-buffer)
;;(global-set-key (kbd "C-c C-c") 'kill-ring-save)
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
;;(evilnc-default-hotkeys)
(add-hook 'lisp-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

(require 'cl)
(require 'powerline)
(require 'powerline-evil)
; colors...
;;(setq powerline-color1 "#222")      ;; dark grey; 
;;(setq powerline-color1 "DarkOrange")      ;; dark grey; 
;;(setq powerline-color2 "#444")      ;; slightly lighter grey
;;(setq powerline-color2 "deep sky blue")      ;; slightly lighter grey
;; shape...
;;(setq powerline-arrow-shape 'arrow) ;; mirrored arrows, 
;; see below for the shape options
(setq tab-width 4)
(add-to-list 'load-path "/home/yo/Downloads/ensime_2.10.0-RC3-0.9.8.2/elisp")

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode t)

;; Remove Yasnippet's default tab key binding
;(define-key yas-minor-mode-map (kbd "<tab>") nil)
;(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Set Yasnippet's key binding to shift+tab
;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
;;(ac-set-trigger-key "TAB")
;;(ac-set-trigger-key "<tab>")

;; (defun yas-ido-expand ()
;;   "Lets you select (and expand) a yasnippet key"
;;   (interactive)
;;     (let ((original-point (point)))
;;       (while (and
;;               (not (= (point) (point-min) ))
;;               (not
;;                (string-match "[[:space:]\n]" (char-to-string (char-before)))))
;;         (backward-word 1))
;;     (let* ((init-word (point))
;;            (word (buffer-substring init-word original-point))
;;            (list (yas-active-keys)))
;;       (goto-char original-point)
;;       (let ((key (remove-if-not
;;                   (lambda (s) (string-match (concat "^" word) s)) list)))
;;         (if (= (length key) 1)
;;             (setq key (pop key))
;;           (setq key (ido-completing-read "key: " list nil nil word)))
;;         (delete-char (- init-word original-point))
;;         (insert key)
;;         (yas-expand)))))
;; ;
;; (define-key yas-ido-expand (kbd "<C-tab>")     'yas-ido-expand)

;;CAMBIAR (set-face-bold-p 'bold 2)
(require 'hideshowvis)
(require 'indent-guide)
;;instalar shell-pop rest  
;;anzu
;;(anzu-mode +1)
;; '(custom-enabled-themes (quote (lavender)))


;;(electric-pair-mode 1)
'(custom-enabled-themes (quote (atom-one-dark)))
;;'(custom-enabled-themes (quote (aurora)))

(load-theme 'atom-one-dark t)
;;(load-theme 'aurora t)

(set-face-bold-p 'bold nil)
 (mapc
  (lambda (face)
    (set-face-attribute face nil :weight 'normal :underline nil))
  (face-list))
(menu-bar-mode -1)

(require 'powerline)
;; colors...
(setq powerline-color1 "#222")      ;; dark grey; 
(setq powerline-color2 "#444")      ;; slightly lighter grey
;; shape...
(setq powerline-arrow-shape 'arrow) ;; mirrored arrows,

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'lisp-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))
;;
;;
;;(add-hook 'prog-mode-hook
      ;;'(lambda ()
         ;;(when (derived-mode-p 'rust-mode) 
	 ;;(ggtags-mode 1))))

;;(global-company-mode) 
;; Reduce the time after which the company auto completion popup opens
;;(setq company-idle-delay 0.2)

;; Reduce the number of characters before company kicks in
;;(setq company-minimum-prefix-length 1)
;; Set path to racer binary
(setq racer-cmd "/home/yo/Downloads/racer/new/racer/target/release/racer")

;; Set path to rust src directory
;;(setq racer-rust-src-path "/Users/YOURUSERNAME/.rust/src/")

;; Load rust-mode when you open `.rs` files
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Setting up configurations when you load rust-mode
(add-hook 'rust-mode-hook

     '(lambda ()
     ;; Enable racer
     (racer-activate)
  
	 ;; Hook in racer with eldoc to provide documentation
     (racer-turn-on-eldoc)
	 
	 ;; Use flycheck-rust in rust-mode
     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
	 
	 ;; Use company-racer in rust mode
     (set (make-local-variable 'company-backends) '(company-racer))
	 
	 ;; Key binding to jump to method definition
     (local-set-key (kbd "M-.") #'racer-find-definition)
	 
	 ;; Key binding to auto complete and indent
     (local-set-key (kbd "TAB") #'racer-complete-or-indent)))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(setq company-tooltip-align-annotations t)


;;(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(setenv "GOPATH" "/home/yo/Downloads/proj/goprojects")
(defun go-mode-setup ()
 (setq compile-command "go build -v && go test -v && go vet")
 (define-key (current-local-map) "\C-c\C-c" 'compile)
 (go-eldoc-setup)
 (setq gofmt-command "goimports")
 (add-hook 'before-save-hook 'gofmt-before-save)
 (require 'company)                                   
 (require 'company-go) 

 (set 
 (make-local-variable 'company-backends) '(company-go))
 (company-mode)
 
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
 (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'go-mode-setup)

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

(require 'auto-complete-config)
(ac-config-default)
(require 'go-autocomplete)
(require 'auto-complete-config)


(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)
(setq indent-line-function 'insert-tab)

; (add-to-list 'load-path "/home/yo/.emacs.d/gofly/goflymake")
; (require 'go-flymake)
