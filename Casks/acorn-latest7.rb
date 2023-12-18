cask "acorn-latest7" do
  version "7.4.4b1-16378"
  sha256 :no_check

  url "https://flyingmeat.com/download/latest/Acorn7Preview.zip"
  name "Acorn"
  desc "Image editor focused on simplicity"
  homepage "https://flyingmeat.com/acorn/"

  livecheck do
    url "https://flyingmeat.com/download/latest/"
    strategy :page_match do |page|
      page.scan(%r{(?<=Acorn 7 Preview\.zip</a> \()(\d+(?:\.\d+)*(?:[ab]\d+) \(\d+\))}i)
          .map { |match| match&.first }
    end
  end

  auto_updates true
  conflicts_with cask: "acorn"

  app "Acorn.app"

  zap trash: [
    "~/Library/Application Scripts/com.flyingmeat.Acorn7.Acornappex",
    "~/Library/Application Scripts/com.flyingmeat.Acorn7.editinacorn",
    "~/Library/Application Support/Acorn",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.flyingmeat.acorn7.sfl3",
    "~/Library/Caches/com.flyingmeat.Acorn7",
    "~/Library/Containers/com.flyingmeat.Acorn7.Acornappex",
    "~/Library/Containers/com.flyingmeat.Acorn7.editinacorn",
    "~/Library/HTTPStorages/com.flyingmeat.Acorn7",
    "~/Library/Preferences/com.flyingmeat.Acorn7.plist",
    "~/Library/Saved Application State/com.flyingmeat.Acorn7.savedState",
  ]
end
