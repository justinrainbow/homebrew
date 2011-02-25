require 'formula'

class NewrelicPhpMonitor <Formula
  url 'http://download.newrelic.com/php_agent/beta/php_agent-osx-1.0.4.384.tar.gz'
  homepage 'http://support.newrelic.com/kb/docs/php-agent'
  md5 '79e35d746901c1bd74617d53c8429a3c'

  # depends_on 'cmake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
