require 'formula'

class MongodbPhp <Formula
  url 'http://pecl.php.net/get/mongo-1.2.2.tgz'
  homepage 'http://pecl.php.net/package/mongo'
  md5 'b589a922222bfe5a13e5b18359e87437'

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
