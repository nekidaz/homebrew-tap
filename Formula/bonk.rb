class Bonk < Formula
  desc "Run Bonk API collections from the terminal and CI"
  homepage "https://github.com/nekidaz/.bonk"
  version "0.3.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/nekidaz/.bonk/releases/download/v#{version}/bonk-aarch64-apple-darwin.tar.gz"
    sha256 "3dd508c7f83363a95a2f90134d5fa9c1dd108432de71e7e6b76588be76193b03"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/nekidaz/.bonk/releases/download/v#{version}/bonk-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4e4aa13fe5b0c6aad020078bdb771ab90cd6ad75b86438178ac804ebb9ba3723"
  end

  def install
    bin.install "bonk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bonk --version")
  end
end
