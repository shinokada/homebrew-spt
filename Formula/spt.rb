class Spt < Formula
  desc "Simple Package Tool - Create Debian packages from GitHub repositories"
  homepage "https://github.com/shinokada/spt"
  url "https://github.com/shinokada/spt/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "4e20bebc60bf34305f995afb02040ed2f43baa5e7b5a3dace2cace626e817b05"
  license "MIT"

  depends_on "curl"
  depends_on "git"
  depends_on "gh"
  depends_on "dpkg"
  
  # Optional but recommended
  depends_on "jq" => :optional

  def install
    bin.install "spt"
    
    # Install lib scripts
    libexec.install "lib"
    
    # Create wrapper script that sets LIBDIR
    (bin/"spt").write_env_script(bin/"spt-orig", LIBDIR: libexec/"lib")
  end

  test do
    # Test that spt is executable and shows version
    assert_match version.to_s, shell_output("#{bin}/spt --version")
  end
end