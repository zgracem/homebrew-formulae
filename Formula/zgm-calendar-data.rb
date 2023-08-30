class ZgmCalendarData < Formula
  desc "Custom data files for BSD's calendar program"
  homepage "https://github.com/zgracem/calendar-data"
  license "MIT"

  stable do
    url "https://github.com/zgracem/calendar-data/releases/download/v1.0.0/calendar-data_1.0.0.zip"
    sha256 "ec8613d72268e9e9f09fc50bde80c8079b6900fff92b14fc868413f62e31e3e0"
  end

  head do
    url "https://github.com/zgracem/calendar-data.git", branch: "main"
  end

  depends_on "zgracem/formulae/calendar"

  def install
    (share/"calendar").install Dir["calendar.*"]
  end

  def caveats
    <<~CAVEAT
      Calendar files have been installed to:
        #{share/"calendar"}
    CAVEAT
  end

  test do
    assert_predicate share/"calendar/calendar.zholiday", :exist?
  end
end
