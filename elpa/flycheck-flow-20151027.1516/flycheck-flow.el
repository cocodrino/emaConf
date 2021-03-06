;;; flycheck-flow.el --- Support Flow in flycheck

;; Copyright (C) 2015 Lorenzo Bolla <lbolla@gmail.com>
;;
;; Author: Lorenzo Bolla <lbolla@gmail.com>
;; Created: 16 Septermber 2015
;; Version: 1.0
;; Package-Version: 20151027.1516
;; Package-Requires: ((flycheck "0.18"))

;;; Commentary:

;; This package adds support for flow to flycheck. To use it, add
;; to your init.el:

;; (require 'flycheck-flow)
;; (add-hook 'javascript-mode-hook 'flycheck-mode)

;; You want to use flow in conjunction with other JS checkers. E.g. to
;; use with gjslint, add this to your init.el
;; (flycheck-add-next-checker 'javascript-gjslint 'javascript-flow)

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(require 'flycheck)

(flycheck-define-checker javascript-flow
    "A JavaScript syntax and style checker using Flow.

See URL `http://flowtype.org/'."
    :command ("flow" source-original)
    :error-patterns
    ((error line-start
	    (file-name)
	    ":"
	    line
	    ":"
	    (minimal-match (one-or-more not-newline))
	    ": "
	    (message (minimal-match (and (one-or-more anything) "\n")))
	    line-end))
    :modes (js-mode js2-mode js3-mode))

(add-to-list 'flycheck-checkers 'javascript-flow t)

(provide 'flycheck-flow)
;;; flycheck-flow.el ends here
