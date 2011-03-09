require 'formula'

class Resty <Formula
  url 'https://github.com/micha/resty/tarball/1.4'
  md5 '136edf4b1703122ed284b13617542614'
  head 'git://github.com/micha/resty.git'
  homepage 'https://github.com/micha/resty'

  # Don't take +x off these files
  skip_clean 'bin'

  def install
    system "mv README.markdown README"
    bin.install %w[pp resty pypp]
  end

  def caveats; <<-EOS.undent
    The Python printy-printer (pypp) uses the json module, available in
    Python 2.6 and newer.

    The Perl printy-printer (pp) depends on JSON from CPAN:
      cpan JSON
    EOS
  end
end
