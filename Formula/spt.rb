class Spt < Formula
  desc "Simple Package Tool - Create Debian packages from GitHub repositories"
  homepage "https://github.com/shinokada/spt"
  url "https://github.com/shinokada/spt/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "a8f31f5a601375c482c877e909585aad6a85457bd7d0fc694c795e982098f557"
  license "MIT"

  depends_on "curl"
  depends_on "git"
  depends_on "gh"
  depends_on "dpkg"

  def install
    libexec.install "spt", "lib"
    bin.install_symlink libexec/"spt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spt --version")
  end
end