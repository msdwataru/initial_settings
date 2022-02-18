;; 対応するカッコをハイライト表示する

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(show-paren-mode t)
;;背景の色を変更
(set-face-background'default"black")
;;日本語の文字コード
(prefer-coding-system 'utf-8-unix)
;;undo
(global-set-key [?\s-z] 'undo)
;; スクロールは１行ごとに
(setq scroll-conservatively 1)
;; シフト＋矢印で範囲選択
(setq pc-select-selection-keys-only t)
;;(pc-selection-mode 1)
;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)
;; C-jで前のwordへ
(global-set-key (kbd "C-j") 'backward-word)
;; C-lで次のwordへ
(global-set-key (kbd "C-l") 'forward-word)
;; c-qで選択領域のコピー
(global-set-key (kbd "C-q") 'kill-ring-save)
;; M-nで6行下に移動
(global-set-key (kbd "M-n") (kbd "C-u 6 C-n"))
;; M-pで6行上に移動
(global-set-key (kbd "M-p") (kbd "C-u 6 C-p"))
;; M-qで置換
(global-set-key (kbd "M-q") 'query-replace)
;; M-sでシェル起動
(global-set-key (kbd "M-s") 'shell-command)
 
;; 行番号を常に表示させる
(global-linum-mode t)
(global-linum-mode)
(setq linum-format "%4d ")

;; Package
(require 'package)
(setq package-user-dir"~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-sta" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)
;(package-refresh-contents) ;この処理重い
;(package-install 'magit)
;(require 'magit)
;(global-set-key (kbd "M-g") 'magit-status)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (stan-mode company-go go-mode jedi magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;(when load-file-name
;  (setq user-emacs-directory (file-name-directory load-file-name)))
;; el-get
;(add-to-list 'load-path (locate-user-emacs-file "el-get"))
;(require 'el-get)
;; el-getでダウンロードしたパッケージは ~/.emacs.d/ に入るようにする
;(setq el-get-dir (locate-user-emacs-file ""))

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

;; go
;; flycheck-modeを有効化してシンタックスエラーを検知
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook (lambda()
       (add-hook 'before-save-hook' 'gofmt-before-save)
       (local-set-key (kbd "M-.") 'godef-jump)
       (set (make-local-variable 'company-backends) '(company-go))
       (setq indent-tabs-mode nil)    ; タブを利用
       (setq c-basic-offset 4)    ; tabサイズを4にする
       (setq tab-width 4)))
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
