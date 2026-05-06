cask "griddle" do
  version "44"
  sha256 "1cddc9d06ea755ac5125f8ade5f0d750de52a6a1dda8a39c1ea668e1f7ddf998"

  url "https://github.com/grahamcarlyle/griddle/releases/download/v#{version}/Griddle.zip"
  name "Griddle"
  desc "macOS window grid utility inspired by GNOME Tactile"
  homepage "https://github.com/grahamcarlyle/griddle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app ".build/Griddle.app", target: "Griddle.app"

  postflight do
    # The release is ad-hoc signed (not notarized), so strip the quarantine
    # xattr to match what the bundled install.sh does. Without this, Gatekeeper
    # blocks first launch with an "unverified developer" error.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Griddle.app"]
  end

  zap trash: [
    "~/.config/griddle",
    "~/Library/Preferences/com.grahamcarlyle.griddle.plist",
  ]
end