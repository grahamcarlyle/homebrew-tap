class Capsper < Formula
  desc "Push-to-talk voice dictation: hold CapsLock, speak, release, text is typed"
  homepage "https://github.com/danielbodart/capsper"
  version "0.326.221"
  url "https://github.com/danielbodart/capsper/releases/download/v#{version}/capsper-macos-arm64.tar.gz"
  sha256 "925f63a169663909f05d98e836faacf4825d11dade6b0049f6014bdd26198731"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"
  depends_on :macos

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+){2})$/i)
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/capsper"
  end

  def caveats
    <<~EOS
      capsper needs a one-time interactive setup to download speech models
      (~250-400 MB), configure microphone permissions, and register the
      background launchd service. Run:

        #{opt_libexec}/install.sh

      To start / stop the service afterwards:

        launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/io.github.danielbodart.capsper.plist
        launchctl bootout   gui/$(id -u) ~/Library/LaunchAgents/io.github.danielbodart.capsper.plist
    EOS
  end

  test do
    assert_match "capsper", shell_output("#{bin}/capsper --help 2>&1", 0..2)
  end
end
