require 'formula'

class PhpRedis <Formula
  url 'http://github.com/owlient/phpredis/tarball/2.0.4'
  homepage ''
  md5 ''

  # depends_on 'cmake'

  def install
    system "phpize"
    system "./configure", "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
