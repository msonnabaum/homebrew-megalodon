require 'formula'

class Megalodon <Formula
  head 'git://github.com/msonnabaum/megalodon.git'
  homepage 'https://github.com/msonnabaum/megalodon'

  def patches; DATA; end

  def install
    prefix.install Dir['config', 'cookbooks', 'formulas', 'roles']
    bin.install "megalodon"
  end
end

__END__
diff --git a/megalodon b/megalodon
index 5aaa092..b2c5e10 100755
--- a/megalodon
+++ b/megalodon
@@ -4,7 +4,7 @@ begin
   require "rubygems"
   require 'chef'
 
-  cwd = Dir.pwd
+  cwd = `brew --prefix megalodon`.strip
   puts "Copying custom forumulas"
   system("cp #{cwd}/formulas/* /usr/local/Library/Formula/")
   puts "Starting chef-solo run"
