class Toilet < Formula
  desc "Color-based alternative to figlet (uses libcaca)"
  homepage "http://caca.zoy.org/wiki/toilet"
  url "http://caca.zoy.org/raw-attachment/wiki/toilet/toilet-0.3.tar.gz"
  mirror "https://deb.debian.org/debian/pool/main/t/toilet/toilet_0.3.orig.tar.gz"
  sha256 "89d4b530c394313cc3f3a4e07a7394fa82a6091f44df44dfcd0ebcb3300a81de"

  license "WTFPL"
  livecheck do
    url "http://caca.zoy.org/raw-attachment/wiki/toilet/"
    regex(/href=.*?toilet[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end
  head do
    url "https://github.com/cacalabs/toilet.git", branch: "master"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "libcaca"

  def install
    %w[
      doc/toilet.1.in
      fonts/Makefile.in
      fonts/Makefile.am
      src/Makefile.in
      src/Makefile.am
    ].each do |file|
      inreplace file do |s|
        s.gsub! %r{/figlet(?!\.c)}, "/figlet/fonts"
      end
    end

    system "./bootstrap" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/toilet", "--version"
  end
end
