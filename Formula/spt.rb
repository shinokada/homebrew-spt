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

  def install
    # Install everything under libexec to preserve directory structure
    libexec.install "spt", "lib"
    
    # Create symlink in bin pointing to the script in libexec
    bin.install_symlink libexec/"spt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spt --version")
  end
end