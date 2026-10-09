cask "bonk" do
  version "0.1.8"
  sha256 "63bef63857b10a4081c72c0b41e84eee4db0a18c23a11c8f2a95febace680048"

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
