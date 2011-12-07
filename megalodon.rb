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
index 61615e5..27020a7 100755
--- a/megalodon
+++ b/megalodon
@@ -4,7 +4,7 @@ begin
   require "rubygems"
   require 'chef'
 
-  cwd = Dir.pwd
+  cwd = `brew --prefix megalodon`.strip
   gem_path = `gem env| grep "EXECUTABLE DIRECTORY"| awk -F': ' '{print $2}'`.strip
   unless File.exists?("#{gem_path}/chef-solo")
     raise "Cannot find chef-solo at #{gem_path}/chef-solo}"
