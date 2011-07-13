require 'formula'
require  Formula.path('php')

class PhpCgi < Php
  ARGV << '--with-cgi'
  ARGV << '--without-apache'
  url 'http://www.php.net/get/php-5.3.6.tar.gz/from/this/mirror'
  homepage 'http://php.net/'
  md5 '88a2b00047bc53afbbbdf10ebe28a57e'
  version '5.3.6'

  # So PHP extensions don't report missing symbols
  skip_clean ['bin', 'sbin']

  depends_on 'gettext'
  depends_on 'readline' unless ARGV.include? '--without-readline'
  depends_on 'libxml2'
  depends_on 'jpeg'
  depends_on 'mcrypt'

  if ARGV.include? '--with-mysql'
    depends_on 'mysql' unless mysql_installed?
  end
  if ARGV.include? '--with-fpm'
    depends_on 'libevent'
  end
  if ARGV.include? '--with-pgsql'
    depends_on 'postgresql'
  end
  if ARGV.include? '--with-mssql'
    depends_on 'freetds'
  end
  if ARGV.include? '--with-intl'
    depends_on 'icu4c'
  end
  if ARGV.include? '--with-imap'
    depends_on 'cclient'
  end
end

__END__
diff -Naur php-5.3.2/ext/tidy/tidy.c php/ext/tidy/tidy.c 
--- php-5.3.2/ext/tidy/tidy.c	2010-02-12 04:36:40.000000000 +1100
+++ php/ext/tidy/tidy.c	2010-05-23 19:49:47.000000000 +1000
@@ -22,6 +22,8 @@
 #include "config.h"
 #endif
 
+#include "tidy.h"
+
 #include "php.h"
 #include "php_tidy.h"
 
@@ -31,7 +33,6 @@
 #include "ext/standard/info.h"
 #include "safe_mode.h"
 
-#include "tidy.h"
 #include "buffio.h"
 
 /* compatibility with older versions of libtidy */
