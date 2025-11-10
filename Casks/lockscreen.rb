cask "lockscreen" do
  sha256 "893cf104aebb4af393f4751f632d279f636c027c58d6864faf80e92a83201030"

  url "https://github.com/gaomd/lock-screen-app/releases/download/v1.0.0-beta.1/Lock-Screen-1.0.0b1.dmg"
  version "1.0.0b1"
  sha256 :no_check
  name "Lock Screen"
  desc "The missing Lock Screen app for Spotlight of macOS"
  homepage "https://github.com/gaomd/lock-screen-app"
  revision 1

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false

  app "Lock Screen.app"

  caveats do
    <<~CAVEAT
      #{token} requires elevated permissions to work.
      You must add both the .app bundle and its `Contents/MacOS/applet` to:
        System Settings → Privacy & Security → Accessibility
    CAVEAT
  end
end
