class Jflex < Formula
  desc "Lexical analyzer generator for Java, written in Java"
  homepage "https://jflex.de"
  url "https://github.com/jflex-de/jflex/releases/download/v1.7.0/jflex-1.7.0.tar.gz"
  sha256 "88d2de7c3345839eaa9182996794cae69b35cf986b54727e37a877e0ec969e80"
  license "MIT"
  revision 1

  depends_on "openjdk"

  def install
    pkgshare.install "examples"
    libexec.install "lib/jflex-full-#{version}.jar" => "jflex-#{version}.jar"
    bin.write_jar_script libexec/"jflex-#{version}.jar", "jflex"
  end

  test do
    system bin/"jflex", "-d", testpath, pkgshare/"examples/cup-java/src/main/jflex/java.flex"
    assert_match "public static void", (testpath/"Scanner.java").read
  end
end