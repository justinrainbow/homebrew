require 'formula'

class PhpApc <Formula
  url 'http://pecl.php.net/get/APC-3.1.4.tgz'
  homepage 'http://php.net/manual/en/book.apc.php'
  md5 '1f7a58f850e795b0958a3f99ae8c2cc4'
  version '3.1.4'

  def install
    Dir.chdir "APC-#{version}" do
      # See http://github.com/mxcl/homebrew/issues/#issue/69
      ENV.universal_binary unless Hardware.is_64_bit?
      system "phpize"
      system "./configure", "--disable-debug", "--disable-dependency-tracking",
                            "--with-php-config=#{Formula.factory('php').prefix}/bin/php-config",
                            "--prefix=#{prefix}"
                            
      system "make install"
      prefix.install 'modules/apc.so'
    end
  end
  
  def caveats; <<-EOS
    
    To enable, add the following to your php.ini file:
    
      [apc]
      extension=apc.so
    
    EOS
  end
end