class Imagemagick < Formula
  desc "Tools and libraries to manipulate images in many formats"
  homepage "https://imagemagick.org/index.php"
  version "7.1.2-3"
  url "https://imagemagick.org/archive/releases/ImageMagick-7.1.2-3.tar.xz"
  sha256 "2943d26f9ac4875aacf16c8f717f4d32ac985fe6a0c0a8e48c24c5cbb3161050"
  license "ImageMagick"
  head "https://github.com/ImageMagick/ImageMagick.git", branch: "main"

  livecheck do
    url "https://imagemagick.org/archive/"
    regex(/href=.*?ImageMagick[._-]v?(\d+(?:\.\d+)+-\d+)\.t/i)
  end

  # From https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/i/imagemagick.rb
  depends_on "pkgconf" => :build
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "jpeg-xl"
  depends_on "libheif"
  depends_on "liblqr"
  depends_on "libpng"
  depends_on "libraw"
  depends_on "libtiff"
  depends_on "libtool"
  depends_on "little-cms2"
  depends_on "openexr"
  depends_on "openjpeg"
  depends_on "webp"
  depends_on "xz"
  # Custom additions
  depends_on "ghostscript"
  depends_on "libmagic" # for `montage` command
  depends_on "mozjpeg"
  depends_on "pango"

  uses_from_macos "bzip2"
  uses_from_macos "libxml2"
  uses_from_macos "zlib"

  on_macos do
    depends_on "gettext"
    depends_on "glib"
    depends_on "imath"
    depends_on "libomp"
  end

  on_linux do
    depends_on "libx11"
    depends_on "libxext"
  end

  skip_clean :la

  def install
    # Avoid references to shim
    inreplace Dir["**/*-config.in"], "@PKG_CONFIG@", Formula["pkg-config"].opt_bin/"pkg-config"
    # versioned stuff in main tree is pointless for us
    inreplace "configure", "${PACKAGE_NAME}-${PACKAGE_BASE_VERSION}", "${PACKAGE_NAME}"

    args = [
      # From homebrew-core
      "--enable-osx-universal-binary=no",
      "--disable-silent-rules",
      "--disable-opencl",
      "--enable-shared",
      "--enable-static",
      "--with-freetype=yes",
      "--with-gvc=no",
      "--with-modules",
      "--with-openjp2",
      "--with-openexr",
      "--with-webp=yes",
      "--with-heic=yes",
      "--with-raw=yes",
      "--with-gslib",
      "--with-gs-font-dir=#{HOMEBREW_PREFIX}/share/ghostscript/fonts",
      "--with-lqr",
      "--without-djvu",
      "--without-fftw",
      "--with-pango",
      "--without-wmf",
      "--enable-openmp",
      # Custom additions
      "--prefix=#{prefix}",
      "--disable-dependency-tracking",
    ]
    if OS.mac?
      args += [
        "--without-x",
        # Work around "checking for clang option to support OpenMP... unsupported"
        "ac_cv_prog_c_openmp=-Xpreprocessor -fopenmp",
        "ac_cv_prog_cxx_openmp=-Xpreprocessor -fopenmp",
        # Add flags from mozjpeg caveats
        "LDFLAGS=-lomp -lz -L#{Formula['mozjpeg'].opt_lib}",
        "CPPFLAGS=-I#{Formula['mozjpeg'].opt_include}",
      ]
    end

    system "./configure", *args, *std_configure_args
    system "make", "install"
  end

  test do
    assert_match "PNG", shell_output("#{bin}/identify #{test_fixtures('test.png')}")

    # Check support for recommended features and delegates.
    features = shell_output("#{bin}/magick -version")
    %w[Modules freetype heic jpeg pangocairo png raw tiff].each do |feature|
      assert_match feature, features
    end

    # Check support for a few specific image formats, mostly to ensure LibRaw linked correctly.
    formats = shell_output("#{bin}/magick -list format")
    ["AVIF  HEIC      rw+", "ARW  DNG       r--", "DNG  DNG       r--", "PANGO* PANGO     r--"].each do |format|
      assert_match format, formats
    end
    assert_match "Helvetica", shell_output("#{bin}/magick -list font")
  end
end
