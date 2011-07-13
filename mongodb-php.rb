require 'formula'

class MongodbPhp <Formula
  url 'http://pecl.php.net/get/mongo-1.1.4.tgz'
  homepage 'http://pecl.php.net/package/mongo'
  md5 '22f1e25690589f6d80d5ed29e56644eb'

  depends_on 'mongodb'

  def install
    extensions = lib + %x[php-config --extension-dir].split('lib/')[1].strip
    Dir.chdir "mongo-#{version}" do
      system "phpize"
      system "./configure", "--prefix=#{prefix}"
      system "make"

      extensions.install "modules/mongo.so"
    end

  end

  def caveats; <<-EOS.undent
    To finish installing mongodb:
     * Add the following lines to php.ini:
        [mongodb]
        extension="#{prefix}/mongo.so"
     * Restart your webserver
    EOS
  end
end
