class Bonk < Formula
  desc "Run Bonk API collections from the terminal and CI"
  homepage "https://github.com/nekidaz/.bonk"
  version "0.2.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/nekidaz/.bonk/releases/download/v#{version}/bonk-aarch64-apple-darwin.tar.gz"
    sha256 "55f25bb05563c2ab6b53f56c8315119031218b02e97b00e71afa7a028a135976"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/nekidaz/.bonk/releases/download/v#{version}/bonk-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "922f5bf1a356048d2140bbd1813c5767dcbd3fc30562af335e99f8bf1c5a14c6"
  end

  def install
    bin.install "bonk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bonk --version")
  end
end
