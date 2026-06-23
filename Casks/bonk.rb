cask "bonk" do
  version "0.1.2"
  sha256 "fc760dfc2c6f4adba6c9ad5439835162f38b95c4b54c2dcefa1b48fb2d22239d"

  url "https://github.com/nekidaz/.bonk/releases/download/v#{version}/bonk_#{version}_aarch64.dmg"
  name "bonk"
  desc "Local-first desktop API client for HTTP and gRPC"
  homepage "https://github.com/nekidaz/.bonk"

  app "bonk.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/bonk.app"]
  end

  zap trash: [
    "~/Library/Application Support/io.github.nekidaz.bonk",
    "~/Library/Caches/io.github.nekidaz.bonk",
    "~/Library/WebKit/io.github.nekidaz.bonk",
  ]
end
