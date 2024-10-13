;;; build-site.el --- Devcinch Website Build -*- lexical-binding: t -*-

;; Copyright © 2024-2024 Mark Woodhall and contributors

;;; Commentary:

;; A build script to generate Devcinch website from org mode

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.


;;; Code:
(require 'ox-publish)

;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "devcinch-org-site"
             :recursive t
             :base-directory "./content"
             :with-author nil
             :with-creator nil
             :with-toc nil
             :with-title nil
             :section-numbers nil
             :publishing-directory "./docs"
             :publishing-function 'org-html-publish-to-html)))

;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-postamble "©Copyright JHJ Technology Limited | Company Number 12418911"
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"icon\" type=\"image/x-icon\" href=\"icon.png\">
<link rel=\"stylesheet\" href=\"simple.css\" />")

;; Generate the site output
(org-publish-all t)

(message "Build complete")



;;; build-site.el ends here
