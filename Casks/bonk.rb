cask "bonk" do
  version "0.1.5"
  sha256 "f8d9f5ed1313410b68d919c27f149b52734256a8c18be2c7f67237e786eac4b8"

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
