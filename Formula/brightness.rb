class Brightness < Formula
  desc "Change macOS display brightness from the command-line"
  homepage "https://github.com/nriley/brightness"
  url "https://github.com/nriley/brightness/archive/bbbe5a26cf8fc0496801c1af84cee9ba53f27a51.zip"
  sha256 "1e6873520d207e6b7a0b139489a5c4a7aba5593e7f1475a049e2956502743fc4"
  license "BSD-2-Clause"

  head do
    url "https://github.com/nriley/brightness.git", branch: "master"
  end

  depends_on :macos

  def install
    if MacOS.version >= :mojave && MacOS::CLT.installed?
      ENV["SDKROOT"] = ENV["HOMEBREW_SDKROOT"] = MacOS::CLT.sdk_path(MacOS.version)
    end
    system "make"
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    system "#{bin}/brightness", "-l"
  end
end
