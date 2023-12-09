;;; ob-js-osascript.el --- `:results osascript' for ob-js  -*- lexical-binding:t -*-

;; Copyright (C) 2023-present CHEN Xian'an (a.k.a `realazy').

;; Maintainer: xianan.chen@gmail.com

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Execute OSAScript w/ JavaScript by `:results osascript'

;;; Code:

(defun ob-js-osascript/org-babel-execute:js/around (orig-fn body params)
  (cond
   ((member "osascript" (map-elt params :result-params))
    (with-temp-buffer
      (insert (org-babel-expand-body:generic
		           body params (org-babel-variable-assignments:js params)))
      (shell-command-on-region (point-min) (point-max)
                               "osascript -l JavaScript -" nil 't)
      (buffer-string)))
   (t (funcall orig-fn body params))))

(with-eval-after-load 'ob-js
  (advice-add 'org-babel-execute:js :around
              #'ob-js-osascript/org-babel-execute:js/around))

(provide 'ob-js-osascript)

;;; ob-js-osascript.el ends here
