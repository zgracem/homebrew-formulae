cask "acorn@preview" do
  version "8.2b1-17217"
  sha256 :no_check

  url "https://flyingmeat.com/download/latest/Acorn#{version.major}Preview.zip"
  name "Acorn"
  desc "Image editor focused on simplicity"
  homepage "https://flyingmeat.com/acorn/"

  livecheck do
    url "https://flyingmeat.com/download/latest/"
    strategy :page_match do |page|
      page.scan(%r{(?<=Acorn #{version.major} Preview\.zip</a> \()(\d+(?:\.\d+)*(?:[ab]\d*)? \(\d+\))}i)
          .map { |match| match&.first }
    end
  end

  auto_updates true
  conflicts_with cask: "acorn"
  depends_on macos: ">= :sonoma"

  app "Acorn.app"

  zap trash: [
    "~/Library/Application Support/Acorn",
    "~/Library/Caches/com.flyingmeat.Acorn#{version.major}",
    "~/Library/Preferences/com.flyingmeat.Acorn#{version.major}.plist",
    "~/Library/Saved Application State/com.flyingmeat.Acorn#{version.major}.savedState",
    "~/Library/Application Scripts/com.flyingmeat.Acorn#{version.major}.*",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.flyingmeat.acorn#{version.major}.sfl3",
    "~/Library/Containers/com.flyingmeat.Acorn#{version.major}.*",
    "~/Library/HTTPStorages/com.flyingmeat.Acorn#{version.major}"
  ]
end
