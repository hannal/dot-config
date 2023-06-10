" https://github.com/esm7/obsidian-vimrc-support

" obsidian-vimrc-support 에서는 mapleader가 적용 안 되며 <Space> 로 직접 지정.
" let mapleader = " "
unmap <Space>

set clipboard=unnamedplus

map <Esc> <C-[>

map <Space>nh :nohl

exmap toggleleftsidebar obcommand app:toggle-left-sidebar
nmap <Space>eo :toggleleftsidebar

exmap togglerightsidebar obcommand app:toggle-right-sidebar
nmap <Space>ts :togglerightsidebar

" exmap focusleftsidebar obcommand file-tree-alternative:open-file-tree-view
exmap focusleftsidebar obcommand file-tree-alternative:reveal-active-file
nmap <Space>ee :focusleftsidebar

exmap back obcommand app:go-back
nmap <C-o> :back

exmap forward obcommand app:go-forward
nmap <C-i> :forward

exmap togglefold obcommand editor:toggle-fold
nmap zf :togglefold
" nmap zo :togglefold
" nmap zc :togglefold
" nmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

exmap searchInVault obcommand omnisearch:show-modal
map <Space>fs :searchInVault

exmap searchInCurrent obcommand omnisearch:show-modal-infile
map <Space>fc :searchInCurrent

exmap searchFile obcommand switcher:open
map <Space>ff :searchFile

" https://github.com/esm7/obsidian-vimrc-support/blob/master/JsSnippets.md
exmap nextHeading jsfile mdHelpers.js {jumpHeading(true)}
exmap prevHeading jsfile mdHelpers.js {jumpHeading(false)}
nmap ]] :nextHeading
nmap [[ :prevHeading

exmap nexttab obcommand workspace:next-tab
map ]t :nexttab

exmap prevtab obcommand workspace:previous-tab
map [t :prevtab

exmap quickadd obcommand quickadd:runQuickAdd
map <Space>qn :quickadd

exmap fllowlink obcommand editor:follow-link
map zgzg :fllowlink

exmap togglebullet obcommand editor:toggle-bullet-list
map <Space>bbl :togglebullet

exmap togglenumberbullet obcommand editor:toggle-numbered-list
map <Space>bnl :togglenumberbullet

nmap zj o<Esc>k
nmap zk O<Esc>j

""" obcommand list
"
" editor:save-file
" editor:follow-link
" editor:open-link-in-new-leaf
" editor:open-link-in-new-split
" editor:open-link-in-new-window
" editor:focus-top
" editor:focus-bottom
" editor:focus-left
" editor:focus-right
" workspace:toggle-pin
" workspace:split-vertical
" workspace:split-horizontal
" workspace:toggle-stacked-tabs
" workspace:edit-file-title
" workspace:copy-path
" workspace:copy-url
" workspace:undo-close-pane
" workspace:export-pdf
" editor:rename-heading
" workspace:open-in-new-window
" workspace:move-to-new-window
" workspace:next-tab
" workspace:goto-tab-1
" workspace:goto-tab-2
" workspace:goto-tab-3
" workspace:goto-tab-4
" workspace:goto-tab-5
" workspace:goto-tab-6
" workspace:goto-tab-7
" workspace:goto-tab-8
" workspace:goto-last-tab
" workspace:previous-tab
" workspace:new-tab
" obsidian-excalidraw-plugin:excalidraw-disable-autosave
" obsidian-excalidraw-plugin:excalidraw-enable-autosave
" obsidian-excalidraw-plugin:excalidraw-download-lib
" obsidian-excalidraw-plugin:excalidraw-open
" obsidian-excalidraw-plugin:excalidraw-open-on-current
" obsidian-excalidraw-plugin:excalidraw-insert-transclusion
" obsidian-excalidraw-plugin:excalidraw-insert-last-active-transclusion
" obsidian-excalidraw-plugin:excalidraw-autocreate
" obsidian-excalidraw-plugin:excalidraw-autocreate-newtab
" obsidian-excalidraw-plugin:excalidraw-autocreate-on-current
" obsidian-excalidraw-plugin:excalidraw-autocreate-popout
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-new-tab
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-on-current
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-popout
" obsidian-excalidraw-plugin:run-ocr
" obsidian-excalidraw-plugin:search-text
" obsidian-excalidraw-plugin:fullscreen
" obsidian-excalidraw-plugin:disable-binding
" obsidian-excalidraw-plugin:export-image
" obsidian-excalidraw-plugin:save
" obsidian-excalidraw-plugin:toggle-lock
" obsidian-excalidraw-plugin:scriptengine-store
" obsidian-excalidraw-plugin:delete-file
" obsidian-excalidraw-plugin:insert-link
" obsidian-excalidraw-plugin:insert-link-to-element
" obsidian-excalidraw-plugin:insert-link-to-element-group
" obsidian-excalidraw-plugin:insert-link-to-element-area
" obsidian-excalidraw-plugin:toggle-lefthanded-mode
" obsidian-excalidraw-plugin:reset-image-to-100
" obsidian-excalidraw-plugin:insert-image
" obsidian-excalidraw-plugin:import-svg
" obsidian-excalidraw-plugin:release-notes
" obsidian-excalidraw-plugin:tray-mode
" obsidian-excalidraw-plugin:insert-md
" obsidian-excalidraw-plugin:insert-pdf
" obsidian-excalidraw-plugin:insert-LaTeX-symbol
" obsidian-excalidraw-plugin:toggle-excalidraw-view
" obsidian-excalidraw-plugin:convert-to-excalidraw
" obsidian-excalidraw-plugin:convert-excalidraw
" dataview:dataview-force-refresh-views
" dataview:dataview-drop-cache
" table-editor-obsidian:next-row
" table-editor-obsidian:next-cell
" table-editor-obsidian:previous-cell
" table-editor-obsidian:format-table
" table-editor-obsidian:format-all-tables
" table-editor-obsidian:insert-column
" table-editor-obsidian:insert-row
" table-editor-obsidian:escape-table
" table-editor-obsidian:left-align-column
" table-editor-obsidian:center-align-column
" table-editor-obsidian:right-align-column
" table-editor-obsidian:move-column-left
" table-editor-obsidian:move-column-right
" table-editor-obsidian:move-row-up
" table-editor-obsidian:move-row-down
" table-editor-obsidian:delete-column
" table-editor-obsidian:delete-row
" table-editor-obsidian:sort-rows-ascending
" table-editor-obsidian:sort-rows-descending
" table-editor-obsidian:evaluate-formulas
" table-editor-obsidian:table-control-bar
" templater-obsidian:insert-templater
" templater-obsidian:replace-in-file-templater
" templater-obsidian:jump-to-next-cursor-location
" templater-obsidian:create-new-note-from-template
" obsidian-outliner:show-release-notes
" obsidian-outliner:system-info
" obsidian-outliner:move-list-item-up
" obsidian-outliner:move-list-item-down
" obsidian-outliner:indent-list
" obsidian-outliner:outdent-list
" obsidian-outliner:fold
" obsidian-outliner:unfold
" recent-files-obsidian:recent-files-open
" obsidian-advanced-uri:copy-uri-current-file
" obsidian-advanced-uri:copy-uri-current-file-simple
" obsidian-advanced-uri:copy-uri-daily
" obsidian-advanced-uri:copy-uri-search-and-replace
" obsidian-advanced-uri:copy-uri-command
" obsidian-advanced-uri:copy-uri-block
" url-into-selection:paste-url-into-selection
" omnisearch:show-modal
" omnisearch:show-modal-infile
" quickadd:runQuickAdd
" quickadd:reloadQuickAdd
" quickadd:testQuickAdd
" obsidian-pandoc:pandoc-export-asciidoc
" obsidian-pandoc:pandoc-export-docx
" obsidian-pandoc:pandoc-export-markdown
" obsidian-pandoc:pandoc-export-html
" obsidian-pandoc:pandoc-export-latex
" obsidian-pandoc:pandoc-export-odt
" obsidian-pandoc:pandoc-export-pptx
" obsidian-pandoc:pandoc-export-epub
" obsidian-pandoc:pandoc-export-pdf
" obsidian-pandoc:pandoc-export-revealjs
" obsidian-pandoc:pandoc-export-beamer
" obsidian-pandoc:pandoc-export-rst
" obsidian-pandoc:pandoc-export-dokuwiki
" obsidian-pandoc:pandoc-export-mediawiki
" app:go-back
" app:go-forward
" app:open-vault
" theme:use-dark
" theme:use-light
" theme:switch
" app:open-settings
" app:show-release-notes
" markdown:toggle-preview
" workspace:close
" workspace:close-window
" workspace:close-others
" workspace:close-tab-group
" workspace:close-others-tab-group
" app:delete-file
" app:toggle-left-sidebar
" app:toggle-right-sidebar
" app:toggle-default-new-pane-mode
" app:open-help
" app:reload
" app:show-debug-info
" app:open-sandbox-vault
" window:toggle-always-on-top
" window:zoom-in
" window:zoom-out
" window:reset-zoom
" file-explorer:new-file
" file-explorer:new-file-in-current-tab
" file-explorer:new-file-in-new-pane
" open-with-default-app:open
" file-explorer:move-file
" file-explorer:duplicate-file
" open-with-default-app:show
" editor:open-search
" editor:open-search-replace
" editor:focus
" editor:toggle-fold
" editor:fold-all
" editor:unfold-all
" editor:fold-less
" editor:fold-more
" editor:insert-wikilink
" editor:insert-embed
" editor:insert-link
" editor:insert-tag
" editor:set-heading
" editor:set-heading-0
" editor:set-heading-1
" editor:set-heading-2
" editor:set-heading-3
" editor:set-heading-4
" editor:set-heading-5
" editor:set-heading-6
" editor:toggle-bold
" editor:toggle-italics
" editor:toggle-strikethrough
" editor:toggle-highlight
" editor:toggle-code
" editor:toggle-blockquote
" editor:toggle-comments
" editor:toggle-bullet-list
" editor:toggle-numbered-list
" editor:toggle-checklist-status
" editor:cycle-list-checklist
" editor:insert-callout
" editor:swap-line-up
" editor:swap-line-down
" editor:attach-file
" editor:delete-paragraph
" editor:toggle-spellcheck
" editor:context-menu
" file-explorer:open
" file-explorer:reveal-active-file
" global-search:open
" switcher:open
" graph:open
" graph:open-local
" graph:animate
" canvas:new-file
" canvas:export-as-image
" canvas:jump-to-group
" canvas:convert-to-file
" tag-pane:open
" daily-notes
" daily-notes:goto-prev
" daily-notes:goto-next
" insert-template
" insert-current-date
" insert-current-time
" note-composer:merge-file
" note-composer:split-file
" note-composer:extract-heading
" command-palette:open
" bookmarks:open
" bookmarks:bookmark-current-view
" bookmarks:bookmark-current-search
" bookmarks:unbookmark-current-view
" bookmarks:bookmark-current-section
" bookmarks:bookmark-current-heading
" bookmarks:bookmark-all-tabs
" markdown-importer:open
" zk-prefixer
" outline:open
" outline:open-for-current
" audio-recorder:start
" audio-recorder:stop
" file-recovery:open
" editor:toggle-source
" file-tree-alternative:open-file-tree-view
" file-tree-alternative:reveal-active-file
" file-tree-alternative: create-new-note
" outgoing-links:open
" outgoing-links:open-for-current
" backlink:open
" backlink:open-backlinks
" backlink:toggle-backlinks-in-document

