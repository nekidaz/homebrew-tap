cask "bonk" do
  version "0.3.0"
  sha256 "0e42022d237f832f8d992ec840ea8966ecdd07e00b16539cb4504ec0e263ee1b"

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
