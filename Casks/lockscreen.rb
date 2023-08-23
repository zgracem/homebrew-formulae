cask "lockscreen" do
  version "1.0.0b1"
  sha256 "893cf104aebb4af393f4751f632d279f636c027c58d6864faf80e92a83201030"

  url "https://github.com/gaomd/lock-screen-app/releases/download/v#{version.to_s.sub('b', '-beta.')}/Lock-Screen-#{version}.dmg"
  name "Lock Screen"
  desc "The missing Lock Screen app for Spotlight of macOS"
  homepage "https://github.com/gaomd/lock-screen-app"

  auto_updates false
  depends_on macos: ">= :high_sierra"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Lock Screen.app"

  caveats do
    <<~CAVEAT
      #{token} requires elevated permissions to work.
      You must add both the .app bundle and its `Contents/MacOS/applet` to:
        System Settings → Privacy & Security → Accessibility
    CAVEAT
  end
end
