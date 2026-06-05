cask "bonk" do
  version "0.1.0"
  sha256 "b1ebe358a717ff742cd6d3a14acd43dca722fd20a1d56e0724d3958e83d3ee59"

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
