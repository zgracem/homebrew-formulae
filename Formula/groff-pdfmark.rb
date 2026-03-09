class GroffPdfmark < Formula
  desc "GNU roff macro packages to facilitate the creation of PDF files"
  homepage "https://savannah.nongnu.org/projects/groff-pdfmark"
  url "https://download.savannah.nongnu.org/releases/groff-pdfmark/groff-pdfmark-20250428.1-posix-bin.tar.xz"
  sha256 "e824fb7d9fa553f07ade51ccd41c888b4c0cb7c8543afa034837a81ca247cb64"
  license "GPL-3.0"

  depends_on "groff"

  resource "manpage" do
    url "https://download.savannah.nongnu.org/releases/groff-pdfmark/groff-pdfmark-20250428.1-man.tar.xz"
    sha256 "cf6fe729dff047f1ffe22e32e12f05140c331cded2f39e5757c1b7b3996a0479"
  end

  resource "tmac" do
    url "https://download.savannah.nongnu.org/releases/groff-pdfmark/groff-pdfmark-20250428.1-tmac.tar.xz"
    sha256 "279135c7ff0297101d0e72b83a3eb4afc83b597283b3045a3e534df1da8f9e6b"
  end

  def install
    bin.install "pdfroff"
    share.install resource("manpage")
    resource("tmac").stage do
      (etc/"groff/site-tmac").install Dir["groff/current/tmac/*.tmac"]
    end
  end

  def caveats
    <<~CAVEAT
      GNU roff macro files have been installed to:
        #{etc/"groff/site-tmac"}
    CAVEAT
  end

  test do
    test_in = testpath/"input.txt"
    test_out = testpath/"output.pdf"
    test_in.write "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    system bin/"pdfroff", test_in, "--pdf-output=#{test_out}"
    assert_path_exists test_out
  end
end
