cask "griddle" do
  version "45"
  sha256 "2404a7c2542e49106fd5b688a76aed3c5a1dc9b0275632766225e02f48a9becc"

  url "https://github.com/grahamcarlyle/griddle/releases/download/v#{version}/Griddle.zip"
  name "Griddle"
  desc "macOS window grid utility inspired by GNOME Tactile"
  homepage "https://github.com/grahamcarlyle/griddle"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+)$/i)
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