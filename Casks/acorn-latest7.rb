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
      page.scan(/(?<=Acorn 7 Preview\.zip<\/a> \()(\d+(?:\.\d+)*(?:[ab]\d+) \(\d+\))/i)
          .map { |match| match&.first }
    end
  end

  auto_updates true
  conflicts_with cask: "acorn"

  app "Acorn.app"

  zap trash: [
    "~/Library/Application Support/Acorn",
    "~/Library/Caches/com.flyingmeat.Acorn#{version.major}",
    "~/Library/Preferences/com.flyingmeat.Acorn#{version.major}.plist",
    "~/Library/Saved Application State/com.flyingmeat.Acorn#{version.major}.savedState",
    "~/Library/Application Scripts/com.flyingmeat.Acorn#{version.major}.*",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.flyingmeat.acorn#{version.major}.sfl3",
    "~/Library/Containers/com.flyingmeat.Acorn#{version.major}.*",
    "~/Library/HTTPStorages/com.flyingmeat.Acorn#{version.major}",
  ]
end
