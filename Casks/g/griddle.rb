cask "griddle" do
  version "43"
  sha256 "272cfe8f346b46b964c3abf0a4a9e04f829d08d9c997b55f9514798f300d13ea"

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

  zap trash: [
    "~/.config/griddle",
    "~/Library/Preferences/com.grahamcarlyle.griddle.plist",
  ]
end