# Homebrew Cask for bonk (macOS).
#
# This file is the source-of-truth template. The release pipeline
# (.github/workflows/homebrew.yml) regenerates it with the published version +
# DMG sha256 and pushes it to the tap repo `nekidaz/homebrew-tap`, so users can:
#
#   brew tap nekidaz/tap
#   brew install --cask bonk
#
# The app is not Apple-notarized, so the cask strips the quarantine attribute on
# install (postflight) — otherwise Gatekeeper would block first launch.
cask "bonk" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
