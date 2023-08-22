class Calendar < Formula
  desc "Displays upcoming relevant dates on a wide variety of calendars"
  homepage "https://packages.debian.org/stable/calendar"
  url "https://deb.debian.org/debian/pool/main/b/bsdmainutils/bsdmainutils_12.1.8.tar.xz"
  sha256 "9e3e693b2f8ca4f3f10f0d154dac092e6251f12dc782a069a22a48c92d11bcbf"
  license "BSD-2-Clause"

  head do
    url "https://salsa.debian.org/meskes/bsdmainutils.git", branch: "master"
  end

  keg_only :provided_by_macos

  depends_on "gcc"
  uses_from_macos "libiconv"

  patch do
    url "https://deb.debian.org/debian/pool/main/b/bsdmainutils/bsdmainutils_12.1.8.tar.xz"
    sha256 "9e3e693b2f8ca4f3f10f0d154dac092e6251f12dc782a069a22a48c92d11bcbf"
    # List from debian/patches/series; the first two are needed to build on macOS 13
    apply "debian/patches/calendar_cap.diff",
          "debian/patches/calendar_wcs.diff",
          "debian/patches/calendar_default.diff",
          "debian/patches/calendar_weekend.diff",
          "debian/patches/calendar_stdio.diff",
          "debian/patches/calendar_man.diff",
          "debian/patches/calendar_fork_cleanup.diff",
          "debian/patches/calendars.diff"
  end

  on_macos do
    patch :DATA
  end

  # Works fine with llvm_clang, though
  fails_with :clang do
    build 1403
    cause "Deprecated function calls"
  end

  def install
    inreplace "config.mk" do |s|
      s.change_make_var! "datadir", share
      s.change_make_var! "bindir", bin
    end

    inreplace "Makefile" do |s|
      # don't build ncal
      s.change_make_var! "BIN", "usr.bin/calendar"
      s.gsub! "$(DESTDIR)/usr", "$(DESTDIR)"
    end

    inreplace "usr.bin/calendar/Makefile" do |s|
      s.remove_make_var! "LIBS"
      s.gsub! "bsd/stdlib.h", "stdlib.h"
    end

    ENV.prepend "LDFLAGS", "-liconv" if OS.mac?
    system "make", "DESTDIR=#{prefix}", "install"
  end

  def post_install
    pkgshare.mkpath
    pkgshare.install Dir["usr.bin/calendar/calendars/calendar.*"]
    pkgshare.install Dir["debian/calendars/calendar.*"]
  end

  test do
    cal_dir = (testpath/".calendar")
    cal_mmdd = "03/11"
    cal_text = "#{cal_mmdd} \tDouglas Adams born in Cambridge, England, 1952"

    # Default file: ~/.calendar/calendar
    cal_dir.mkpath
    (cal_dir/"calendar").write <<~EOS
      #ifndef _calendar_test_
      #define _calendar_test_
      #{cal_text}
      #endif
    EOS
    require "date"
    cal_date = Date.parse(cal_mmdd)
    assert_match cal_text.sub(cal_mmdd, cal_date.strftime("%b %d")),
                 shell_output("#{bin}/calendar -t #{cal_date.strftime('%m%d')}")
  end
end

__END__
diff --git a/usr.bin/calendar/calendar.h b/usr.bin/calendar/calendar.h
index 2697dee..6775b98 100644
--- a/usr.bin/calendar/calendar.h
+++ b/usr.bin/calendar/calendar.h
@@ -29,6 +29,7 @@
  * SUCH DAMAGE.
  */

+#include <sys/types.h>
 #include <wchar.h>

 extern struct passwd *pw;
