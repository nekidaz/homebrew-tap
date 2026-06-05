cask "bonk" do
  version "0.1.1"
  sha256 "e6d9896b9466780da8359679be6943cda8d3bb70f069cba1fcc3a0ac562da73a"

  url "https://github.com/nekidaz/.bonk/releases/download/v#{version}/bonk_#{version}_universal.dmg"
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
