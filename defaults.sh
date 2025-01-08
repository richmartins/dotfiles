# Change the whitespace settings value
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6

defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes

defaults write com.apple.screencapture type jpg
mkdir ~/Desktop/screenshots
defaults write com.apple.screencapture location ~/Desktop/screenshots

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;

defaults write com.apple.Dock showhidden -bool TRUE && killall Dock

killall Finder;
killall Dock;

defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Zoom In" "@$1"
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Zoom Out" "@$-"

# change default shortcut for "Move focus to the menu bar" to option+tab
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 27 "{enabled = 1; value = { parameters = (65535, 48, 8388608); type = 'standard'; }; }"

defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false # textEdit open new file instead of open panel
defaults write -g ApplePressAndHoldEnabled -bool false # disable press and hold for keys with accents [Needs to logout to take effect]



