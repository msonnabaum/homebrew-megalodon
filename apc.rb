require 'formula'

class Apc < Formula
  url 'http://pecl.php.net/get/APC-3.1.6.tgz'
  homepage 'http://pecl.php.net/package/apc'
  md5 '624b8030254f897face30789d64e6b7e'
  head "http://svn.php.net/repository/pecl/apc/trunk/", :using => :svn

  depends_on 'pcre'

  def install
    extensions = lib + %x[php-config --extension-dir].split('lib/')[1].strip

    Dir.chdir "APC-#{version}" unless ARGV.build_head?
    system "phpize"
    system "./configure", "--prefix=#{prefix}"
    system "make"

    prefix.install "apc.php"
    extensions.install "modules/apc.so"
  end

  def caveats; <<-EOS.undent
    To finish installing APC:
     * Add the following lines to php.ini:
        [apc]
        extension="#{prefix}/apc.so"
        apc.enabled=1
        apc.shm_segments=1
        apc.shm_size=64M
        apc.ttl=7200
        apc.user_ttl=7200
        apc.num_files_hint=1024
        apc.mmap_file_mask=/tmp/apc.XXXXXX
        apc.enable_cli=1
     * Restart your webserver
     * Copy "#{prefix}/apc.php" to any site to see APC's usage.
    EOS
  end
end
