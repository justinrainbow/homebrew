require 'formula'

class Xhprof <Formula
  url 'http://pecl.php.net/get/xhprof-0.9.2.tgz'
  homepage 'http://mirror.facebook.net/facebook/xhprof/doc.html'
  md5 'ae40b153d157e6369a32e2c1a59a61ec'

  def install
    Dir.chdir "xhprof-#{version}/extension" do
      # See http://github.com/mxcl/homebrew/issues/#issue/69
      ENV.universal_binary unless Hardware.is_64_bit?

      system "phpize"
      system "./configure", "--with-php-config=#{Formula.factory('php').prefix}/bin/php-config",
                            "--prefix=#{prefix}"
      system "make"
      prefix.install 'modules/xhprof.so'
    end
  end

  def caveats
      <<-EOS
To use this software:
 * Add the following line to php.ini:
    [xhprof]
    extension="#{prefix}/xhprof.so"
    ;
    ; directory used by default implementation of the iXHProfRuns
    ; interface (namely, the XHProfRuns_Default class) for storing
    ; XHProf runs.
    ;
    xhprof.output_dir=<directory_for_storing_xhprof_runs>
 * Restart your webserver.
 * Write a PHP page that calls "phpinfo();"
 * Load it in a browser and look for the info on the xhprof module.
 * If you see it, you have been successful!
      EOS
  end
end