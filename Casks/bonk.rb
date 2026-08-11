cask "bonk" do
  version "0.1.7"
  sha256 "b35e62df4c928694060d64a2e209ff0a19c2f73756610fe88e3befdf60d9e219"

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
