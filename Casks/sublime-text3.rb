cask "sublime-text3" do
  version "3.211"
  sha256 "531c84e24983927c59dc0c5611f605776f917d1c516af80c69c09ea232d24e01"

  url "https://download.sublimetext.com/Sublime%20Text%20Build%20#{version.no_dots}.dmg"
  name "Sublime Text 3"
  desc "Text editor for code, markup and prose"
  homepage "https://www.sublimetext.com/3"

  # deprecate! date: "2023-12-17", because: :discontinued

  auto_updates false
  conflicts_with cask: %w[
    sublime-text
    sublime-text2
    sublime-text-dev
  ]

  app "Sublime Text.app"
  binary "#{appdir}/Sublime Text.app/Contents/SharedSupport/bin/subl"

  bundle_id = "com.sublimetext.#{version.major}"
  uninstall quit: "#{bundle_id}"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/#{bundle_id}.sfl*",
    "~/Library/Application Support/Sublime Text #{version.major}",
    "~/Library/Caches/#{bundle_id}",
    "~/Library/HTTPStorages/#{bundle_id}",
    "~/Library/Preferences/#{bundle_id}.plist",
    "~/Library/Saved Application State/#{bundle_id}.savedState",
  ]
end
