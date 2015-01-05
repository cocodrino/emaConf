(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#002b36")
 '(background-mode dark)
 '(column-number-mode t)
 '(cursor-color "#839496")
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a5beb9b1d6dc23dd8a3c204c159c9a5f1e0115ff14b5b8579d6f3ede4f3b3aee" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#839496")
 '(markdown-command "rdiscount")
 '(markdown-command-needs-filename nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MonacoB2" :foundry "b&h" :slant normal :weight bold :height 88 :width normal)))))


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

;;(require 'indent-guide)
;;(indent-guide-global-mode)
; General Auto-Complete
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

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


(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)
(require 'evil-visualstar)


(load-theme 'solarized-dark)
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

(require 'auto-complete-config)
(ac-config-default)

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
(evil-leader/set-key "ss" 'save-buffer)
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
(setq powerline-color1 "#222")      ;; dark grey; 
(setq powerline-color2 "#444")      ;; slightly lighter grey
;; shape...
(setq powerline-arrow-shape 'arrow) ;; mirrored arrows, 
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
(set-face-bold-p 'bold 2)

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'lisp-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))
;;
;;

